class Phase < ActiveRecord::Base
  belongs_to :championship
  has_many :matches
  
  validates_presence_of :championship_id, :on => :create, :message => "A fase deve pertencer a um campeonato"
  
  before_save :update_matches
  
  def update_matches
    matches.each { |m| m.save! }
 	end
  
  #
  # Todas as partidas devem estar terminadas para a fase ser concluida
  #
  def done?
    matches.each do |m| 
    	return false unless m.done?
 		end
    true
  end
  
  def done!
  	winners=[]
  	
    matches.each do |m| 
    	m.done = true
#    	winners << m.winner
		end
		
#		p = Phase.new
#   	p.matches << Match.new({:home => winners[0], :visitor => winners[1]})
   	
#   	championship.phases << p
   	
  end
  
  def forward
    raise Exception.new if not done?
    
    winners = matches.collect{|m| m.winner}
    
    p = Phase.new
    i=0
    while i <  winners.size do
      p.add_match Match.new({:home=>winners[i], :visitor=>winners[i+1]}) 
      i = i+2
    end
    
    p
  end
  
  def add_match match
    matches << match
  end
  
end
