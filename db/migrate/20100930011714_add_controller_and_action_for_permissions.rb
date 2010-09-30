class AddControllerAndActionForPermissions < ActiveRecord::Migration
  def self.up
    add_column :permissions, :controller, :string, :null => false
    add_column :permissions, :action, :string, :null => false
  end

  def self.down
    remove_column :permissions, :controller
    remove_column :permissions, :action
  end
end
