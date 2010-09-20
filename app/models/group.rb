class Group < ActiveRecord::Base
  has_many :user_profiles

  validates_presence_of :name
  validates_length_of :name, :in => 2..10

  def self.to_array
    Group.find(:all).collect { |g| [g.name, g.id] }
  end
  
  def to_s
    self.name unless self.blank?
  end
end
