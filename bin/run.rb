#!/usr/bin/env ruby
$:<< File.join(File.dirname(__FILE__), '..', 'lib')

require 'feed'

feed = Feed.parse('http://sports.yahoo.com/top/rss.xml')
feed.items.each { |item| puts item }
