namespace :db do 
  desc "添加所有的Controller和Action到数据库"
  task :permissions => :environment do
    #加载系统的所有controller和action
    controllers = Utility.get_controllers
    
    #历遍所有的controller
    controllers.each do |controller|
      controller_class = controller.constantize
      #历遍所有的action
      next if Enum::EXCEPT_CONTROLLER.index(controller_class.controller_path)
      controller_class.action_methods.each do |action|
        next if Enum::EXCEPT_ACTION.index(action)
        if p = is_blank?(controller_class.controller_path, action)
          Logger.error(p.class)
          p.controller_name = replace_controller(controller_class.controller_path)
          p.action_name = replace_action(action)
          p.name = "#{controller_class.controller_path}/#{action}"
          p.save
        else
          p = Permission.new
          p.controller_name = replace_controller(controller_class.controller_path)
          p.action_name = replace_action(action)
          p.name = "#{controller_class.controller_path}/#{action}"
          p.save
        end
      end
    end 
  end
  
  
  
  #检查权限
  def is_blank?(controller_name, action_name)
    if p = Permission.by_controller_action(controller_name, action_name).first    
      return p
    else
      return false
    end
  end
  
  def replace_controller(controller_name)
    result = case controller_name
      when "admin/users" then "人事模块"
      when "admin/positions" then "职称模块"
      when "admin/roles" then "角色模块"
      when "admin/groups" then "部门模块"
      when "admin/permissions" then "权限模块"
      else
        "未知模块"
    end
    return result
  end
  
  def replace_action(action_name)
    result = case action_name
      when "index" then "列表"
      when "edit" then "修改"
      when "new" then "添加"
      when "destroy" then "删除"
      when "users" then "用户角色"
      when "permissions" then "角色授权"
      else
        "未知"
    end
    return result
  end
  
end
