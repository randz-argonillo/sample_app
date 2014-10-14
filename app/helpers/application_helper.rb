module ApplicationHelper
  
  def full_title(title)
    if title.empty?
      "Sample App"
    else
      "#{title}"
    end
  end
  
end
