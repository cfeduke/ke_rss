require 'spec_helper'
require 'feed'
describe Feed do
  context "when given a valid URL" do
    let(:url) { 'http://sports.yahoo.com/top/rss.xml' }
    describe "#parse" do
      subject { Feed.parse(url).items }
      its (:size) { should be_> 0 }
    end
  end
end
