class Match < ActiveRecord::Base
  
  belongs_to :home, :class_name => "Team"
  belongs_to :visitor, :class_name => "Team" 
  belongs_to :phase 
  
  validates_numericality_of :home_score, :on => :create, :message => "is not a number"
  validates_numericality_of :visitor_score, :on => :create, :message => "is not a number"


  def winner
    if visitor.nil? 
      return home
    end
    
    if home.nil? 
      return visitor
    end
    
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
  
  def incomplete?
    home.nil? || visitor.nil?
  end
    
end
