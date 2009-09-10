class Match < ActiveRecord::Base

  has_one :home_team, :class_name => "Team"
  has_one :foreign_team, :class_name => "Team"

	validates_presence_of :home_team
	validates_presence_of :foreign_team
  
  attr_accessor :home_team
  attr_accessor :foreign_team
  
  attr_accessor :home_score
  attr_accessor :foreign_score
  
  def initialize attributes
    @home_score = 0
    @foreign_score = 0
    super
  end
  
  def get_rematch
    Match.new @foreign_team.clone, @home_team.clone
  end
  
  
  def winner
    if @home_score > @foreign_score
      @home_team
    elsif @foreign_score > @home_score 
      @foreign_team
    end
  end
  
  def invert
  	aux = @foreign_team
  	@foreign_team = @home_team
  	@home_team = @foreign_team
	self
  end
  	
    
end
