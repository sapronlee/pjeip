class Position < ActiveRecord::Base
  has_many :user_profiles

  def self.to_array
    Position.find(:all).collect { |p| [p.name, p.id] }
  end
end
