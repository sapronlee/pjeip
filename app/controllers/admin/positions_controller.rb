class Admin::PositionsController < Admin::ApplicationController
  def index
    @positions = initialize_grid(Position,
      :per_page => Setting.page_size.to_i,
      :order => "id",
      :include => [:user_profiles])
  end

  def new
    @position = Position.new
    render :action => :edit
  end

  def edit
    @position = Position.find params[:id]
  end

  def create
    @position = Position.new params[:position]
    if @position.save
      success_notice "部门创建成功!"
      redirect_to admin_positions_path
    else
      render :action => :edit
    end
  end

  def update
    @position = Position.find params[:id]
    if @position.update_attributes(params[:position])
      success_notice "部门修改成功!"
      redirect_to admin_positions_path
    else
      render :action => :edit
    end
  end

  def destroy
    @position = Position.find params[:id]
    if @position.destroy
      success_notice "部门删除成功!"
    else
      error_notice "部门删除失败!"
    end
    redirect_to admin_positions_path
  end

end
