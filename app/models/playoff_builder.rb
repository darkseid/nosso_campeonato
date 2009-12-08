class PlayoffBuilder
  Max = 16
  
  
  def build_championship(teams, name="vazio")
    raise "Utilize no máximo 16 times" if teams.size > Max
    teams = fill_teams(teams)
    matches = []
    
    teams << Team.new unless teams.size % 2 == 0

		# TODO eliminar este random e adotar uma heuristica melhor
    teams = teams.sort_by {rand(7)}
		
    c = Championship.create :name => name
    c.phases << Phase.create

    i=0
    num_of_teams = teams.size
    while i < teams.size do
    	m = Match.create({:home => teams[i], :visitor => teams[i+1]})
      c.phases.first.matches << m
      i = i + 2
    end
    
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
    (1..(need_to_fill-teams.size)).each{|i| teams << Team.new(:name => nil)}
    teams
  end
  
  def next_phase_based_on phase
  
  	winners = phase.matches.collect{ |m| m.winner }
  	
  	num_of_matches_for_new_phase = phase.matches.size / 2
  
  	new_phase = Phase.new
  
  	num_of_matches_for_new_phase.times do |i|
			new_phase.matches << Match.new({:home => winners.shift, :visitor => winners.shift})
 		end
 			
  	new_phase
	end
  
end
