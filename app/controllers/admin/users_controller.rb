class Admin::UsersController < Admin::ApplicationController
  def index
  end
  
  def new
    @user = User.new
    @profile = @user.user_profile
    @groups = Group.to_array
    @positions = Position.to_array
  end

  def create
    @user = User.new
    if @user.save
      save_notice "用户创建成功!"
      redirect_to admin_users_path  
    else
      render :action => :new
    end
  end

  def edit
  end

  def update
  end

  def destroy
  end
end
