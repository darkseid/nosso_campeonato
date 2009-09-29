class Team < ActiveRecord::Base
  
  has_and_belongs_to_many :matches
  
  validates_presence_of :name, :on => :create, :message => "Não pode ser vazio"
  
  attr_accessor :points
  
  def add_score score
    @points = points + score
  end
  
  def points
    @points || 0
  end
  
end
