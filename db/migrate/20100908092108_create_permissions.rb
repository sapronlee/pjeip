class CreatePermissions < ActiveRecord::Migration
  def self.up
    create_table :permissions do |t|
      t.string :name
      t.string :controller_name, :null => false
      t.string :action_name, :null => false
      t.timestamps
    end

    create_table :permissions_roles, :id => false do |t|
      t.integer :role_id
      t.integer :permission_id
      t.timestamps
    end

    add_index :permissions_roles, [:role_id, :permission_id], :unique => true
    add_index :permissions_roles, :permission_id, :unique => false
  end

  def self.down
    drop_table :permissions
    drop_table :permissions_roles
  end
end
