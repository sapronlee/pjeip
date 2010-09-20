module BasePermissions::Permissions
  def self.included(base)
    base.send(:include, InstanceMethods)
    base.extend(ClassMethods)
  end

  module ClassMethods
    def get_controllers
      controllers = nil
      require_all_controllers unless controllers
      controllers ||= ApplicationController.subclasses
    end
    
    def generate_permission
      #加载系统的所有controller和action
      controllers = get_controllers
    
      #历遍所有的controller
      controllers.each do |controller|
        controller_class = controller.constantize
        #历遍所有的action
        next if Enum::EXCEPT_CONTROLLER.index(controller_class.controller_path)
        controller_class.action_methods.each do |action|
          next if Enum::EXCEPT_ACTION.index(action)
          if p = is_blank?(controller_class.controller_path, action)            
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

    
    private   
    def require_all_controllers(path = "#{[RAILS_ROOT]}/app/controllers")
      Dir.foreach(path) do |e|
        next if e =~ /^\./
        controller_path = File.join(path, e)
        if File.directory?(controller_path)
          require_all_controllers(controller_path)
        elsif e =~ /controller.rb$/
          ApplicationController.require_or_load(controller_path)
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

  module InstanceMethods
  end

end

Utility.send(:include, BasePermissions::Permissions)
