module ApplicationHelper
  
  def admin_types
    ['AdminUser']
  end
  
  def user_types
    ['Employee', 'User']
  end
  
    def active?(path)
        "active" if current_page?(path)
    end

    def status_label status
      status_span_generator status
    end

private
  
  def status_span_generator status
    case status
      when 'submitted', 'pending'
        content_tag(:span, status.titleize, class: 'label label-primary')
      when 'approved','confirmed'
        content_tag(:span, status.titleize, class: 'label label-success')
      when 'rejected'
        content_tag(:span, status.titleize, class: 'label label-danger')
    end
  end
end