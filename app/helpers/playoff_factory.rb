class PlayoffFactory
  Max = 16
  
  def build_championship teams
    raise "Utilize no máximo 16 times" if teams.size > Max
    teams = fill_teams(teams)
    matches = []
    
    phases = []
    
    teams << Team.new unless teams.size % 2 == 0
    
    i=0
    num_of_teams = teams.size
    while i < teams.size do
      matches << Match.new({:home_team => teams[i], :foreign_team => teams[i+1]})
      i = i + 2
    end
    puts matches
    c = Championship.new
    c.matches = matches
    return c
  end

  #
  #  Para dar certo o campeonato de playoffs, é necessário ter um numero de times igual a 2, 4, 8, 16, etc.
  #  O método a seguir preenche o array de times para ter o tamanho correto.
  #
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
  
end