class User < ActiveRecord::Base
  has_one :user_profile, :dependent => :destroy
  has_and_belongs_to_many :roles
  acts_as_authentic do |c|
    c.logged_in_timeout = 1.minutes
    c.validate_login_field = false
    c.validate_email_field = false 
  end

  validates_length_of :login, :in => 2..10
  



  def permissions
    user_permissions = []
    self.roles.each do |role|
      user_permissions += role.permissions
    end
    user_permissions.uniq!
    return user_permissions
  end

  def to_s
    self.login
  end
end
