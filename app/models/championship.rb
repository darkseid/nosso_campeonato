class Championship < ActiveRecord::Base
  has_many :teams
  has_many :matches
  
  def generate_matches
    
    aux_teams = teams.clone
    
    teams.each do |team|
      aux_teams.delete(team)
      aux_teams.each { |foreign_team| matches << Match.new(team, foreign_team) }
    end
    matches
  end
end
