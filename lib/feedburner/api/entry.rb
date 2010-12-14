# encoding: utf-8
require 'ostruct'

module FeedBurner  
  module Api
    class Entry < OpenStruct
      
      attr_reader :items
      
      def initialize(*args)
        super
        @items = []
        
        parse_attributes
      end
      
      protected
      
        def parse_attributes
          if @table.has_key?(:item)
            @items << Item.new(@table[:item])
          end  
        end
    end
  end
end
