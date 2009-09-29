class Match < ActiveRecord::Base

  has_and_belongs_to_many :teams
  
  validates_numericality_of :home_team_score, :on => :create, :message => "is not a number"
  validates_numericality_of :foreign_team_score, :on => :create, :message => "is not a number"

  def home
    teams[0]
  end
  
  def visitor
    teams[1]
  end

  def winner
    return home if home_team_score > foreign_team_score
    return visitor if foreign_team_score > home_team_score
    nil
  end
  
  def draw?
    winner.nil?
  end
  
  def eql? other
    home.eql? other.home and visitor.eql? other.visitor
  end
  
  def to_s
    #{}"#{home_team.name} #{home_team_score} X #{foreign_team_score} #{foreign_team.name}"
  end
  
    
end
