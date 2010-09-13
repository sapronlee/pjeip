class UserProfile < ActiveRecord::Base
  belongs_to :group
  belongs_to :position
  belongs_to :user
end
