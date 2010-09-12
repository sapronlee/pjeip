class CreateUserProfiles < ActiveRecord::Migration
  def self.up
    create_table :user_profiles do |t|
      t.references :user
      t.string :name, :null => false
      t.integer :gender, :null => false, :limit => 1
      t.integer :card_number, :null => false, :limit => 18
      t.datetime :job_begin, :null => false
      t.datetime :job_end
      t.timestamps
    end
  end

  def self.down
    drop_table :user_profiles
  end
end
