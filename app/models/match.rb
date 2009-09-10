class Match < ActiveRecord::Base
  DRAW = "Draw"

  has_one :home_team, :class_name => "Team"
  has_one :foreign_team, :class_name => "Team"

	validates_presence_of :home_team
	validates_presence_of :foreign_team

  validates_numericality_of :home_team_score, :on => :create, :message => "is not a number"
  validates_numericality_of :foreign_team_score, :on => :create, :message => "is not a number"

  def winner
    return home_team if home_team_score > foreign_team_score
    return foreign_team if foreign_team_score > home_team_score
    nil
  end
  
  def draw?
    winner.nil?
  end
    
end
