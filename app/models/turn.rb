class Turn < ActiveRecord::Base
  has_many :phases
  belongs_to :championship
  
  validates_presence_of :name, :on => :create, :message => "can't be blank"
  
end
