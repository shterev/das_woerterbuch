module NotificationHelper

  def danger_notification(title=nil, text)
    notification(:danger, title, text)
  end

  def warning_notification(title=nil, text)
    notification(:warning, title, text)
  end

  def info_notification(title=nil, text)
    notification(:info, title, text)
  end

  def success_notification(title=nil, text)
    notification(:success, title, text)
  end

  def notification(type, title=nil, text)
    content_tag(:div, class: bem_class_for(:notification, [type])) do
      content = []
      content << content_tag(:span, title, class: 'notification__title') if title.present?
      content << content_tag(:span, text, class: 'notification__text')
      content.join.html_safe
    end
  end

end