class User < ActiveRecord::Base
  acts_as_authentic do |c|
    logged_in_timeout = 1.minutes
  end
end
