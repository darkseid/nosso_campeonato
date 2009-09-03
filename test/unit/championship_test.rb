require 'test_helper'

class ChampionshipTest < ActiveSupport::TestCase
  # Replace this with your real tests.
  test "geracao de campeonatos de pontos corridos: 3 times sem returno" do
    
    c = Championship.new
    # c.teams << teams(:corinthians)
    # c.teams << teams(:santos)
    # c.teams << teams(:sao_paulo)

    c = ChampionshipFactory.build_championship [teams(:corinthians), teams(:santos), teams(:sao_paulo)]    
    matches = c.matches
    
    assert_equal(3, matches.size)
    assert_equal(teams(:corinthians), matches[0].home_team)
    assert_equal(teams(:santos), matches[0].foreign_team)
    assert_equal(teams(:corinthians), matches[1].home_team)
    assert_equal(teams(:sao_paulo), matches[1].foreign_team)    
    assert_equal(teams(:santos), matches[2].home_team)
    assert_equal(teams(:sao_paulo), matches[2].foreign_team)    

  end
end