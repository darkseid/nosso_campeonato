class ChampionshipFactory
  
  def self.build_championship teams
    aux_teams = teams.clone
    matches = []
    teams.each do |team|
      aux_teams.delete(team)
      aux_teams.each do |foreign_team|
        m = Match.new({:home_team => team, :foreign_team => foreign_team}) 
        matches << m
      end
    end
    
    c = Championship.new    
    c.matches = matches
    c
  end
end