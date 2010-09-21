class Permission < ActiveRecord::Base
  has_and_belongs_to_many :roles

  named_scope :by_controller_action, lambda { |c, a| {:conditions => ["controller_name = ? and action_name = ?", c, a]} }
  named_scope :group_by_controller, {:group => "controller_name"}
  
  validates_presence_of :name, :controller_name, :action_name
  
  def self.collect_permissions
    permissions = self.find(:all).group_by(&:controller_name)
    permissions.delete_if do |key, value|
      Enum::EXCEPT_CONTROLLER.include?(key)
    end
    permissions.each_value do |values|
      values.delete_if do |p|
        Enum::EXCEPT_ACTION.include?(p.action_name)
      end
    end
    return permissions
  end
  
  def self.clear
    ActiveRecord::Base.connection.execute("TRUNCATE TABLE `permissions`")  
  end
end
