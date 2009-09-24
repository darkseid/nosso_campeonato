class PlayoffFactory
  Max = 16
  
  def build_championship teams
    raise "Utilize no máximo 16 times" if teams.size > Max
    teams = fill_teams(teams)
    matches = []
    
    teams << Team.new unless teams.size % 2 == 0
    
    i=0
    num_of_teams = teams.size
    while i < teams.size do
      matches << Match.new({:home_team => teams[i], :foreign_team => teams[i+1]})
      teams << Team.new(:name=>"Winner#{i/2 + 1}")
      i = i + 2
    end
    puts matches
    c = Championship.new
    c.matches = matches
    return c
  end

  def fill_teams teams
    i = 0
    need_to_fill = 0
    while i ** 2 <= Max and need_to_fill == 0 do
      need_to_fill = (2 ** i) if teams.size <= (2 ** i)
      i = i + 1
    end
    (1..(need_to_fill-teams.size)).each{|i| teams << Team.new(:name => "Empty#{i}")}
    teams
  end

  def num_of_phases num_of_teams
    
    num_of_teams = num_of_teams + 1 unless num_of_teams % 2 == 0
    
    aux = 1 
    return aux if num_of_teams == 2
    
    aux = aux + num_of_phases(num_of_teams / 2)
        
    aux
  end
  
end