# FeedBurner
module FeedBurner
  autoload :Version, 'feedburner/version'
  autoload :Api,     'feedburner/api'
  
  class ServerError < RuntimeError; end
  class FeedNotFound < ServerError; end
  class FeedNotPermit < ServerError; end
  class MissingRequiredParameter < ServerError; end
  class MalformedParameter < ServerError; end
  
  # The URI of the feed (same as http://feedproxy.google.com/<feeduri>) 
  # Must be used if id is not specified
  mattr_accessor :feed_uri
  @@feed_uri = "blogspot/tuAm"
  
  # The FeedBurner id of the feed (visible when editing a feed in your account, e.g., http://feedburner.google.com/fb/a/optimize?id=<id>). 
  # May be used instead if uri is not specified.
  mattr_accessor :feed_id
  @@feed_id = nil
  
  # Logger
  mattr_accessor :logger
  @@logger = nil
  
  # Current Basic Feed Awareness Data
  #
  # Arguments:
  #  - uri 	The URI of the feed (same as http://feedproxy.google.com/<feeduri>) Must be used if id is not specified
  #  - id 	The FeedBurner id of the feed (visible when editing a feed in your account, e.g., http://feedburner.google.com/fb/a/optimize?id=<id>). May be used instead if uri is not specified.
  #  - dates 	Dates are used to specify the period for which data is need (see note on dates http://code.google.com/apis/feedburner/awareness_api.html#dates)
  #
  def self.get_feed_data(options = {})
    Api.call('GetFeedData', default_options.merge(options))
  end
  
  # Current Item Awareness Data
  #
  # Arguments:
  #  - uri 	The URI of the feed (same as http://feedproxy.google.com/<feeduri>)
  #  - itemurl 	The source URL of item (not the FeedBurner generated URL, but the original source URL). 
  #             Multiple itemurl parameters may be provided in a single request in order to retrieve additional items.
  #  - dates 	Dates are used to specify the period for which data is need
  #
  def self.get_item_data(options = {})
    Api.call('GetItemData', default_options.merge(options))
  end
  
  # Current Item Resyndication Feed Awareness Data
  # 
  # Arguments:
  #  - uri 	The URI of the feed (same as http://feedproxy.google.com/<feeduri>)
  #  - itemurl 	The source URL of item (not the FeedBurner generated URL, but the original source URL). 
  #             Multiple itemurl parameters may be provided in a single request in order to retrieve additional items.
  #
  #  - dates 	Dates are used to specify the period for which data is need#
  def self.get_resyndication_data(options = {})
    Api.call('GetResyndicationData', default_options.merge(options))
  end
  
  protected
  
    def self.default_options
      options = { :uri => @@feed_uri }
      options[:id] = @@feed_id unless @@feed_id.blank?
      options
    end
end
