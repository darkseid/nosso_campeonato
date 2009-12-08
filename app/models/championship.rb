class Championship < ActiveRecord::Base
  has_many :phases
  belongs_to :user

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
  	phases.last.done? && phases.last.matches.size == 1
  end
  
  def next_phase
    phases << phases.last.forward
    phases.last
  end
  
end
