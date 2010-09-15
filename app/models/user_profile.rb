class UserProfile < ActiveRecord::Base
  belongs_to :group
  belongs_to :position
  belongs_to :user
  
  validates_presence_of :name, :gender, :birthdate, :id_card, :address, :entry_date, :group_id, :position_id
  validates_length_of :id_card, :is => 18
  validates_format_of :birthdate, :with => /^(\d{1,4})(-)(\d{1,2})\2(\d{1,2})$/ 

end

