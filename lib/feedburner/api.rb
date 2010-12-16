# encoding: utf-8
require 'net/http'
require 'net/https'
require 'rack/utils'
require 'ostruct'

module FeedBurner  
  module Api
    autoload :Feed,    'feedburner/api/feed'
    autoload :Entry,   'feedburner/api/entry'
    autoload :Item,    'feedburner/api/item'
    autoload :Referer, 'feedburner/api/referer'
    
    class << self
      
      BASE_URL = "https://feedburner.google.com/api/awareness/1.0/"
      
      def call(method, params, cookies = {})
        options = { :timestamp => Time.now.to_i }.merge(params)
        url = File.join(uri.path, method)
        response = request(url, options)
        
        if FeedBurner.debug
          FeedBurner.logger.info(url)
          FeedBurner.logger.info(response.body)
        end
        
        parse_response(response)
      end
      
      def uri
        @@uri ||= URI.parse(BASE_URL)
        @@uri
      end
      
      protected

        def request(path, params = {})
          query = Rack::Utils.build_query(params)
          url = "#{path}?#{query}"
          
          client.request(Net::HTTP::Get.new(url))
        end

        def client
          client = Net::HTTP.new(uri.host, uri.port)
          client.use_ssl = true
          client.verify_mode = OpenSSL::SSL::VERIFY_NONE

          client
        end

        def parse_response(response)
          if response.code.to_i >= 400
            raise ServerError, "The FeedBurner service is temporarily unavailable. (4XX)"
          else
            begin
              document = ActiveSupport::XmlMini.parse(response.body)
            rescue Exception => e
              FeedBurner.logger.info("Error parse: #{response.body}")
              FeedBurner.logger.error(e)
              return
            end
            
            if document['rsp']['stat'] == 'ok'
              return Feed.new(document['rsp']['feed'])
            elsif document['rps']['stat'] == 'fail'
              message = document['rps']['err']['msg']
              code = (document['rps']['err']['code'] || 0).to_i
              
              process_error(code, message)
            else
              raise ServerError, "Error parse FeedBurner response: #{response.body}"
            end
          end
        end
        
        def parse_error(code, message)
          case code
            when 1 then
              raise FeedNotFound, message
            when 2 then
              raise FeedNotPermit, message
            when 3 then
              raise FeedNotFound, message
            when 4 then
              raise ServerError, message
            when 5 then
              raise MissingRequiredParameter, message
            when 6 then
              raise MalformedParameter, message
            when 0 then
              raise ServerError, "Error parse FeedBurner error code: #{response.body}"
          end
        end
    end
  end
end
