class Enum
  #过滤添加的action
  EXCEPT_ACTION = ["captcha_validated?"]
  
  EXCEPT_CONTROLLER = ["home","admin/home"]
  
  EXCEPT_PERMISSION_ACTION = ["update","create", "users", "permissions"]
  
  PERMISSION_ACTIONS = ["index", "show", "new", "edit", "destory"]

  USER_GENDER = {
    :female => 0,
    :male => 1
  }
end
