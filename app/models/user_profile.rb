class UserProfile < ActiveRecord::Base
  belongs_to :group
  belongs_to :position
  belongs_to :user
  
  validates_presence_of :name, :gender, :birthdate, :id_card, :address, :entry_date
end
