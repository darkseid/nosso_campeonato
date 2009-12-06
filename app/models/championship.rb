class Championship < ActiveRecord::Base
  has_many :phases

  #
  # Informa o campeao do campeonato
  #
  def winner
    if finished? 
      return phases.last.matches.last.winner.name
    end
    
    nil
  end
  
  #
  # Informa se o campeonato terminou
  #
  def finished?
    phases.each{|p| return false unless p.done?}
    true
  end
  
  def next_phase
    phases << phases.last.forward
    phases.last
  end
  
end
