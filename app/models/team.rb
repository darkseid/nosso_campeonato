class Team < ActiveRecord::Base
  
  has_one :match
  
  validates_presence_of :name, :on => :create, :message => "Não pode ser vazio"
  validates_numericality_of :points, :on => :create, :message => "is not a number"
  
  def add_points score
    self[:points] = points + score
  end
  
end
