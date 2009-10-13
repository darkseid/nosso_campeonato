class ChampionshipFactory
  
  def self.build_championship teams
    aux_teams = teams.clone
    matches = []
    teams.each do |team|
      aux_teams.delete(team)
      aux_teams.each do |foreign_team|
        m = Match.new({:home => team, :visitor => foreign_team}) 
        matches << m
      end
    end
    
    c = Championship.new    
    p = Phase.new
    p.matches = matches
    c.phases << p
    c
  end
end