class Admin::PermissionsController < Admin::ApplicationController
  def index
     @permissions = initialize_grid(Permission,
      :per_page => Setting.page_size.to_i,
      :order => "id")
  end
  
  def new
    @permission = Permission.new
    render :action => :edit
  end
  
  def edit
    @permission = Permission.find params[:id]
  end
  
  def create
    @permission = Permission.new params[:permission]
    if @permission.save
      success_notice "权限创建成功"
      redirect_to admin_permissions_path
    else
      render :action => :edit
    end
  end
  
  def update
    @permission = Permission.find params[:id]
    if @permission.update_attributes params[:permission]
      success_notice "权限修改成功!"
      redirect_to admin_permissions_path
    else
      render :action => :edit
    end
  end
  
  def destroy
    @permission = Permission.find params[:id]
    if @permission.destroy
      success_notice "权限删除成功!"
    else
      error_notice "权限删除失败!"
    end
    redirect_to admin_permissions_path
  end
end
