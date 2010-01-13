class User < ActiveRecord::Base
  devise :authenticatable
  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation
end
