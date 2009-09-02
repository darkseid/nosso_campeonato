class Match < ActiveRecord::Base

  has_one :home_team, :class_name => "Team"
  has_one :foreign_team, :class_name => "Team"

  
  attr_accessor :home_team
  attr_accessor :foreign_team
  
  attr_accessor :home_score
  attr_accessor :foreign_score
  
  def initialize t1, t2
    @home_team = t1
    @home_score = 0
    @foreign_team = t2
    @foreign_score = 0
  end
  
  
  def winner
    if @home_score > @foreign_score
      @home_team
    elsif @foreign_score > @home_score 
      @foreign_team
    end
  end
    
end
