class ApplicationController < ActionController::Base
  helper :all
  protect_from_forgery 
  filter_parameter_logging :password, :password_confirmation
  helper_method :current_user_session, :current_user
  before_filter :require_user, :except => [:login, :login_user] #登录
  before_filter :auth_permission #权限


  private
   #用户的session
   def current_user_session
     return @current_user_session if defined?(@current_user_session)
     @current_user_session = UserSession.find
   end
   
   #当前用户
   def current_user
     return @current_user if defined?(@current_user)
     @current_user = current_user_session && current_user_session.record
   end
   
   #需要用户登录
   def require_user
     unless current_user
       store_location
       redirect_to login_path
       return false
     end
   end
   
   #不需要用户登录
   def require_no_user
     if current_user
       store_location
       redirect_back_or_default root_path
       return false
     end 
   end
   
   #获取跳转地址
   def store_location
     session[:return_to] = request.request_uri
   end
   
   #跳转回上一页或者是指定页面
   def redirect_back_or_default(default)
     redirect_to(session[:return_to] || default)
     session[:return] = nil
   end
  
   #设置页面标题,关键字,描述
   def set_seo_meta(title, keywords='', description='')
     if title
       @page_title = "#{title} | #{Setting.web_name}"
     else
       @page_title = "#{Setting.web_name}"
     end
     @keywords = keywords
     @description = description
   end

  # 保存提示消息
  def save_notice(notice, error = false)
    if error
      flash[:notice_error] = notice
    else
      flash[:notice_success] = notice  
    end    
  end

  # 错误提示
  def error_notice(notice)
    save_notice(notice, true)
  end
  
  # 错误提示
  def success_notice(notice)
    save_notice(notice, false)
  end
  
  # 权限验证
  def auth_permission
    return true if current_user.admin?
    user_permissions = current_user.permissions    
    unless user_permissions.detect { |p| p.controller == controller_path && warp_action(action_name).index(p.action)}
      redirect_403
      return false
    end
  end
  
  def redirect_403
    redirect_to "/403.html"
  end
  
  def warp_action(action_name)
    result = case action_name
      when 'new', 'create' then ['new', 'create']
      when 'edit', 'update' then ['edit', 'update']
      when 'index', 'show' then ['index', 'show']
      when 'users', 'update_users' then ['users', 'update_users']
      when 'permissions', 'update_permissions' then ['permissions', 'update_permissions']
      else
        action_name.to_a
    end
    return result    
  end

end
