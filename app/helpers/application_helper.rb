module ApplicationHelper
  
  def full_title(title)
    if title.empty?
      "Sample App"
    else
      "Sample App #{title}"
    end
  end
  
end
