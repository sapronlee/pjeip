class AddDscriptionToRoles < ActiveRecord::Migration
  def self.up
    add_column :roles, :description, :string
  end

  def self.down
    remove_column :roles, :description
  end
end
