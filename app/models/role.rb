class Role < ActiveRecord::Base
  has_and_belongs_to_many :users, :uniq => true
  has_and_belongs_to_many :permissions, :uniq => true

  validates_presence_of :name, :description
end
