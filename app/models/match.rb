class Match < ActiveRecord::Base

#  has_one :home, :class_name => "Team"
#  has_one :visitor, :class_name => "Team"
  
  belongs_to :home, :class_name => "Team"
  belongs_to :visitor, :class_name => "Team" 
  belongs_to :phase 
  
  validates_numericality_of :home_score, :on => :create, :message => "is not a number"
  validates_numericality_of :visitor_score, :on => :create, :message => "is not a number"
  validates_presence_of :home, :on => :create, :message => "can't be blank"
  validates_presence_of :visitor, :on => :create, :message => "can't be blank"

  def winner
    return home if home_score > visitor_score
    return visitor if visitor_score > home_score
    nil
  end
  
  def draw?
    winner.nil?
  end
  
  def eql? other
    home.eql? other.home and visitor.eql? other.visitor
  end
  
  def to_s
    "#{home.name} #{home_score} X #{visitor_score} #{visitor.name}"
  end
  
    
end
