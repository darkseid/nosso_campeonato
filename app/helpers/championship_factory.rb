class ChampionshipFactory
  
  def self.build_championship teams
    aux_teams = teams.clone
    puts aux_teams.inspect
    matches = []
    teams.each do |team|
      aux_teams.delete(team)
      aux_teams.each { |foreign_team| matches << Match.new(team, foreign_team) }
    end
    
    c = Championship.new    
    c.matches = matches
    c
  end
end