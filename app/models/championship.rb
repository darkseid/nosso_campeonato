class Championship < ActiveRecord::Base
  has_many :phases

  #
  # Informa o campeao do campeonato
  #
  def winner
    
  end
  
  #
  # Informa se o campeonato terminou
  #
  def finished?
    phases.each{|p| return false unless p.done?}
    true
  end
end
