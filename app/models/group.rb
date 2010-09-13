class Group < ActiveRecord::Base
  has_many :user_proflies

  def self.to_array
    Group.find(:all).collect { |g| [g.name, g.id] }
  end
end
