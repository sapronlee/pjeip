module ApplicationHelper
  
  #显示信息
  def notice_message
    if flash[:notice_success]
      result = "<div id=\"success_message\" class=\"successMessage\">#{flash[:notice_success]}</div>"
    elsif flash[:notice_error]
      result = "<div id=\"error_explanation\" class=\"errorExplanation\">#{flash[:notice_error]}</div>"
    else
      result = ''
    end
    return result
  end
  
  def page_title
    @page_title || "YTRIP EIP"
  end

  def is_allow(controller_name, action_name)
    if current_user.permissions.detect { |p| p.controller_name == controller_name && p.action_name == action_name }
      return true
    else
      return false
    end
  end

  def current_page(controller_name, actions = nil)
    if action_name.blank?
      if controller.controller_path == controller_name
        return " class=\"current\""
      end
    else
      unless actions.blank?
        if actions.index(controller.action_name)
          return " class=\"current\""
        end
      end
    end
  end
end
