class Admin::UsersController < Admin::ApplicationController
  def index
    @users = initialize_grid(User,
                            :per_page => Setting.page_size.to_i,
                            :conditions => ["object_type = ?", "User"],
                            :order => "id",
                            :include => [:profile])
  end
  
  def new
    @user = User.new
    @user.build_profile
    render :action => :edit
  end

  def create
    @user = User.new(params[:user])
    @user.save_default_password
    if @user.save
      success_notice "用户创建成功!"
      redirect_to admin_users_path  
    else
      render :action => :edit
    end
  end

  def edit
    @user = User.find params[:id]
  end

  def update
    @user = User.find params[:id]
    if @user.update_attributes(params[:user])
      success_notice "用户修改成功!"
      redirect_to admin_users_path
    else
      render :action => :edit
    end
  end

  def destroy
    @user = User.find params[:id]
    if @user.destroy
      success_notice "用户删除成功!"
    else
      error_notice "用户删除失败!"
    end
    redirect_to admin_users_path
  end
end
