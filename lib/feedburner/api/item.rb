# encoding: utf-8
require 'ostruct'

module FeedBurner  
  module Api
    class Item < OpenStruct
    
      attr_reader :referers
    
      def initialize(*args)
        super
        @referers = []
        
        parse_attributes
      end
      
      protected
      
        def parse_attributes
          if @table.has_key?(:referer)
            @referers << Referer.new(@table[:referer])
          end
        end
    end
  end
end
