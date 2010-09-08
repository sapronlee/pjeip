Setting.create(:key => "web_name", :value => "Ytrip EIP", :description => "网站名字")
Setting.create(:key => "web_description", :value => "Ytrip is EIP", :description => "网站描述")
Setting.create(:key => "login_captcha", :value => "0", :description => "登录是否验证")

User.create(:login => "sapronlee", :password => "123123", :password_confirmation => "123123", :email => "sapronlee@gmail.com")

Role.create(:name => "管理员")
Role.create(:name => "普通用户")
