class Admin::SettingsController < Admin::ApplicationController  
  
  def edit
    set_seo_meta "全局设置"
  end
  
  def update
    settings = params[:settings]
    
    begin
      Setting.transaction do
        settings.each do |key, value|
          Setting.update_all(["value = ?", value], ["settings.`key` = ?", key])
        end
      end
      success_notice "设置修改成功!"    
    rescue
      success_notice "设置修改失败!"
    end
    redirect_to edit_admin_settings_path
  end
end
