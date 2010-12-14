# encoding: utf-8
require 'ostruct'

module FeedBurner  
  module Api
    class Feed < OpenStruct
      
      attr_reader :uid, :entries
      
      def initialize(*args)
        super
        
        @entries = []
        @uid = nil
        
        parse_attributes
      end
      
      protected
      
        def parse_attributes
          if @table.has_key?(:id)
            @uid = @table[:id]
          end
          
          if @table.has_key?(:entry)
            @entries << Entry.new(@table[:entry])
          end
        end
    end
  end
end
