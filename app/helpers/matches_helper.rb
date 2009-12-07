module MatchesHelper
  
  def print_match m
    if m.incomplete?
      "<b>#{m.winner.name}</b>"
    else
      "<b>#{m.home.name} #{m.home_score} X #{m.visitor_score} #{m.visitor.name}</b>"
    end    
  end
  
end
