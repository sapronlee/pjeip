module Admin::UsersHelper
  def display_gender(gender)
    case gender
    when 1:
      return "男"
    when 0:
      return "女"
    end
  end

  def display_leave_date(leave_date)
    if leave_date.blank?
      return "在职"
    else
      return "离职"
    end
  end
end
