module ApplicationHelper

  SITE_NAME = "Mondiale"

  def site_name
    return SITE_NAME
  end

  def titler(page_title)
    page_title.empty? ? site_name : "#{site_name} | #{page_title}"
  end

end
