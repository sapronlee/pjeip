module Admin::RolesHelper
  
  def display_permission_group_name(name)
    result = case name
      when "admin/users" then "会员模块"
      when "admin/positions" then "职称模块"
      when "admin/roles" then "角色模块"
      when "admin/groups" then "部门模块"
      when "admin/permissions" then "权限模块"
      else "未知模块"
    end
    return result
  end
  
  def display_permission_name(name)
    result = case name
      when "new" then "添加"
      when "edit" then "修改"
      when "index" then "列表"
      when "show" then "查看"
      when "destroy" then "删除"
      when "users" then "角色授权"
      when "permissions" then "权限授权"
      else "未知"
    end
    return result
  end
  
end
