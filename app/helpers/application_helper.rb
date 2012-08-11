module ApplicationHelper
  def body_css_id
    controller_name.camelize :lower
  end

  def app_wrapper_css_class
    "#{controller_name.camelize :lower}-#{action_name.camelize :lower}"
  end

  def single_large(url)
    url.gsub(".JPG", "X.JPG")
  end

  def all_large(url, id)
    url.gsub("1.JPG", "#{id}X.JPG")
  end

  def all_thumbs(url, id)
    url.gsub("1.JPG", "#{id}.JPG")
  end

  def hide_lasts(str)
    if str.blank?
      ""
    else
     tmp = str.delete!(str[-4, 4])
     tmp << '****'
    end
  end
end
