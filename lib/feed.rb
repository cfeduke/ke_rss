require 'hpricot'
require 'open-uri'
require 'item'

class Feed
  attr_reader :items
  def initialize(items)
    @items = items
  end
  
  class << self
    def parse(url)
      items = []
      doc = Hpricot.parse(open(url))
      
      (doc/:item).each do |item|
        items << Item.new(item)
      end
      Feed.new(items)
    end
  end
end
