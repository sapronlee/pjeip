class CreateUserProfiles < ActiveRecord::Migration
  def self.up
    create_table :user_profiles do |t|
      
      t.references :user
      t.references :group
      t.references :position
      
      t.string :name, :null => false #名字
      t.integer :gender, :null => false, :limit => 1 #性别
      t.datetime :birthdate, :null => false #出生日期
      t.integer :id_card, :null => false, :limit => 18 #身份证号码
      t.string :address, :null => false #地址
      t.datetime :entry_date, :null => false #入职日期
      t.datetime :leave_date #离职日期

      t.timestamps
    end
  end

  def self.down
    drop_table :user_profiles
  end
end
