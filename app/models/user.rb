class User < ActiveRecord::Base
  has_and_belongs_to_many :roles
  acts_as_authentic do |c|
    logged_in_timeout = 1.minutes
  end

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
