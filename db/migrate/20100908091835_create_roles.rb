class CreateRoles < ActiveRecord::Migration
  def self.up
    create_table :roles do |t|
      t.string :name, :null => false
      t.timestamps
    end

    #2.create users roles table
    create_table :roles_users, :id => false do |t|
      t.integer :user_id
      t.integer :role_id
      t.timestamps
    end

    #3.create users_roles table index
    add_index :roles_users, [:user_id, :role_id], :unique => true
    add_index :roles_users, :role_id, :unique => false

  end

  def self.down
    drop_table :roles
    drop_table :roles_users
  end
end
