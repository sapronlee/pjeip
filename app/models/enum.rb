class Enum
  #过滤action
  #这里过滤是不被添加到数据库中
  EXCEPT_ACTION = ["captcha_validated?", "logout", "login", "create", "update", "update_permissions", "update_users"]
  
  #过滤controller
  #这里过滤是不被添加到数据库中
  EXCEPT_CONTROLLER = ["home","admin/home", "admin/permissions"]
  
  #过滤权限的action
  #这里过滤是不被显示在角色授权页面
  EXCEPT_PERMISSION_ACTION = ["update", "create", "update_users", "update_permissions"]
  
  #指定要获取的权限action
  PERMISSION_ACTIONS = ["index", "show", "new", "edit", "destory"]  

  #性别
  USER_GENDER = {
    :female => 0,
    :male => 1
  }
end
