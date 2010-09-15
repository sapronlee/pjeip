class Position < ActiveRecord::Base
  has_many :user_profiles

  validates_presence_of :name
  validates_length_of :name, :in => 2..10

  def self.to_array
    Position.find(:all).collect { |p| [p.name, p.id] }
  end
end
