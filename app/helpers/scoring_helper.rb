module ScoringHelper
  
  def compute_scoring match    
    if match.draw?
      match.home.add_points 1
      match.visitor.add_points 1
    else
      match.winner.add_points 3
    end  
  end  
end
