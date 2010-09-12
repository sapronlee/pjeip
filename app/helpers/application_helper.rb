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

end
