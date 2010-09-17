class Admin::RolesController < Admin::ApplicationController
  def index
    @roles = initialize_grid(Role,
      :per_page => Setting.page_size.to_i,
      :include => [:users],
      :order => "id")
  end

  def new 
    @role = Role.new
    render :action => :edit
  end

  def edit
    @role = Role.find params[:id]
  end

  def create
    @role = Role.new params[:role]
    if @role.save
      success_notice "角色创建成功!"
      redirect_to admin_roles_path
    else
      render :action => :edit
    end
  end

  def update
    @role = Role.find params[:id]
    if @role.update_attributes(params[:role])
      success_notice "角色修改成功!"
      redirect_to admin_roles_path
    else
      render :action => :edit
    end
  end

  def destroy
    @role = Role.find params[:id]
    if @role.destroy
      success_notice "角色删除成功!"
    else
      error_notice "角色删除失败!"
    end
    redirect_to admin_roles_path
  end

  #角色添加用户
  def users    
    @role = Role.find(params[:id])
    @users = User.employees
  end
  
  def update_users
    @role = Role.find(params[:id])
    if @role.users = params[:users].blank? ? [] : User.find(params[:users])
      success_notice "角色分配成功!"
    else
      error_notice "角色分配失败!"
    end
    redirect_to admin_roles_path
  end
  
  def permissions
    @role = Role.find(params[:id])
    @permissions = Permission.collect_permissions
    @role_permissions = @role.permissions
  end
  
  def update_permissions
    
  end
end
