class Admin::PositionsController < Admin::ApplicationController
  def index
    @positions = initialize_grid(Position,
      :per_page => Setting.page_size.to_i,
      :order => "id",
      :include => [:user_profiles])
    set_seo_meta "职称列表"
  end

  def new
    @position = Position.new
    set_seo_meta "添加职称"
    render :action => :edit
  end

  def edit
    @position = Position.find params[:id]
    set_seo_meta "修改职称"
  end

  def create
    @position = Position.new params[:position]
    if @position.save
      success_notice "职称创建成功!"
      redirect_to admin_positions_path
    else
      render :action => :edit
    end
  end

  def update
    @position = Position.find params[:id]
    if @position.update_attributes(params[:position])
      success_notice "职称修改成功!"
      redirect_to admin_positions_path
    else
      render :action => :edit
    end
  end

  def destroy
    @position = Position.find params[:id]
    if @position.destroy
      success_notice "职称删除成功!"
    else
      error_notice "职称删除失败!"
    end
    redirect_to admin_positions_path
  end

end
