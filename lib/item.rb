class Item
  attr_reader :title, :link, :description, :html

  def initialize(raw)
    @title = raw.at(:title).html
    @link = raw.at('link').next # bogus yahoo RSS XML
    @description = raw.at(:description)
    @html = raw.at('media:text')
    @html = @html.html if @html.respond_to? :html
    @description = @html unless @html.nil?
  end

  def to_s
    "#{@title} - #{@link}\n#{@description}\n\n"
  end
end
