module FeedBurner
  module Version
    MAJOR = 0
    MINOR = 0
    RELEASE = 3

    def self.dup
      "#{MAJOR}.#{MINOR}.#{RELEASE}"
    end
  end
end
