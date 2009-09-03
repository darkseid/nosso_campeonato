require 'test_helper'

class MatchTest < ActiveSupport::TestCase
  # Replace this with your real tests.
  test "winner_result_draw" do
    
    t1 = teams :corinthians
    t2 = teams :santos
    
    m = Match.new t1,t2
    assert_nil(m.winner)    
    
  end
  
  test "home_team_is_winner" do
    
    t1 = teams :corinthians
    t2 = teams :santos
    
    m = Match.new t1,t2
    m.home_score = 4
    m.foreign_score = 2
    
    assert_equal(t1, m.winner)
  end
  
  test "foreign_team_is_winner" do
    
    t1 = teams :corinthians
    t2 = teams :santos
    
    m = Match.new t1,t2
    m.home_score = 1
    m.foreign_score = 2
    
    assert_equal(t2, m.winner)
    
  end    
  
  test "getting a rematch" do
    
    t1 = teams :corinthians
    t2 = teams :santos
  
    match = Match.new t1,t2
    puts match
    
    m = match.get_rematch
    assert_equal('corinthians', m.foreign_team.name)
    assert_equal('santos', m.home_team.name)

  end
  
end
