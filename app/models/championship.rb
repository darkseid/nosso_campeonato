class Championship < ActiveRecord::Base
  has_many :phases

	attr_accessor :name
	attr_accessor :num_teams
	

  def winner?
    
  end
end
