class User < ActiveRecord::Base
  has_one :user_profile, :dependent => :destroy
  has_and_belongs_to_many :roles
  
  set_inheritance_column 'object_type'
  
  acts_as_authentic do |c|
    c.logged_in_timeout = 1.minutes
    c.validate_login_field = false
    c.validate_email_field = false
    c.validate_password_field = false 
  end

  validates_presence_of :login, :email
  #validates_length_of :login, :in => 2..10
  #validates_uniqueness_of :login, :email
  #validates_format_of :email, :with => /^(?:[a-z\d]+[_\-\+\.]?)*[a-z\d]+@(?:([a-z\d]+\-?)*[a-z\d]+\.)+([a-z]{2,})+$/i
  validates_associated :user_profile
  

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
  
  def admin?
    self.class == Admin
  end
end
