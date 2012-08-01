class Item
  attr_reader :title, :link, :description, :html

  def initialize(raw)
    @raw = raw
    @title = raw.at(:title).html
    @link = html_content_at :link
    # handle bogus yahoo RSS XML
    @link = raw.at('link').next if @link.nil? || @link.empty?
    @description = html_content_at :description
    @html = html_content_at 'media:text'
    @description = @html unless @html.nil?
  end

  def to_s
    "#{@title} - #{@link}\n#{@description}\n\n"
  end

  private
  def html_content_at(location)
    value = @raw.at(location)
    value = value.html if value.respond_to? :html
  end
end
