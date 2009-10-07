module MatchesHelper
  
  def show_match match
    
    if match.done?
      home_score = match.home_score
      visitor_score = match.visitor_score
    else
      home_score = text_field_tag "home_score[#{match.id}]"
      visitor_score = text_field_tag "visitor_score[#{match.id}]"
    end
    
    "#{match.home.name} #{home_score} X #{visitor_score} #{match.visitor.name}"  
  end
  
end
