module ScoringHelper
  
  def compute_scoring match    
    if match.draw?
      match.home_team.add_score 1
      match.foreign_team.add_score 1
    else
      match.winner.add_score 3
    end  
  end  
end
