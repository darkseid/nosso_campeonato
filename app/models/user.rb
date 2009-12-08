class User < ActiveRecord::Base
  devise :authenticable #, :all
  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation
  
  has_many :championships
end
