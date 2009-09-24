class Team < ActiveRecord::Base
  validates_presence_of :name, :on => :create, :message => "Não pode ser vazio"
  
  attr_accessor :points
  
  def add_score score
    @points = points + score
  end
  
  def points
    @points || 0
  end
  
end
