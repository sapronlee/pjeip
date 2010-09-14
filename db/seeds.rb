#添加网站设置
Setting.create(:key => "web_name", :value => "Ytrip EIP", :description => "网站名字")
Setting.create(:key => "web_description", :value => "Ytrip is EIP", :description => "网站描述")
Setting.create(:key => "login_captcha", :value => "0", :description => "登录是否验证")
Setting.create(:key => "page_size", :value => "10", :description => "分页数")
#添加用户
Admin.create(:login => "sapronlee", :password => "123123", :password_confirmation => "123123", :email => "sapronlee@gmail.com")

#添加角色
Role.create(:name => "管理员")
Role.create(:name => "普通用户")

Group.create(:name => "网站开发部")
Group.create(:name => "美术部")

Position.create(:name => "程式工程师")
Position.create(:name => "美术设计师")
