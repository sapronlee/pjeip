class HomeController < ApplicationController

  validates_captcha

  def index
    set_seo_meta "首页"
  end

  def login
    @user_session = UserSession.new
    set_seo_meta "登录页"
    render :layout => false
  end

  def login_user
    unless request.post?
      return redirect_to login_path
    end

    @user_session = UserSession.new(params[:user_session])
    
    login_captcha = Setting.login_captcha.to_bool
    if login_captcha and !captcha_validated?
      error_notice "验证码错误!"
      return redirect_to login_path
    end
    
    if @user_session.save
      redirect_to root_path
    else
      error_notice "用户名或密码错误!"
      redirect_to login_path
    end
  end

  def logout
    current_user_session.destroy
    redirect_back_or_default root_path
  end

end
