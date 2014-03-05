module ApplicationHelper

  SITE_NAME = "Mondiale"

  def site_name
    return SITE_NAME
  end

  def titler(page_title)
    page_title.empty? ? site_name : "#{site_name} | #{page_title}"
  end

  def markdown(text)
    unless text.nil? || text.empty?
      options = {
        autolink: true, filter_html: true, hard_wrap: true, highlight: true,
        no_intra_emphasis: true, no_styles: true, prettify: true, quote: true
      }
      @markdown ||= Redcarpet::Markdown.new(Redcarpet::Render::SmartyHTML, options)
      @markdown.render(text).html_safe
    end
  end

end
