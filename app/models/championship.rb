class Championship < ActiveRecord::Base
  has_many :phases

	attr_accessor :champ_builder

  def winner
    phases.last.matches[0].winner if finished?
  end

	def next_phase
		phase = phases.last
		#raise Exception.new 'championship already finished' if phase.done?
		
		new_phase = champ_builder.next_phase_based_on(phase)
		phases << new_phase
		new_phase
	end
  
  def finished?
  	phases.last.matches.size == 1 && phases.last.done?
 	end
  
end
