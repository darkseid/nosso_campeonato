require "test_helper"

class TestLibraryFileName < Test::Unit::TestCase

  def setup
    @factory = PlayoffFactory.new
  end

  def test_num_of_phase_for_2_teams
    n = @factory.num_of_phases 2    
    assert_equal(1, n)
  end
  
  def test_num_of_phase_for_3_teams
    n = @factory.num_of_phases 3    
    assert_equal(2, n)
  end
  
  def test_num_of_phase_for_4_teams
    n = @factory.num_of_phases 4  
    assert_equal(2, n)
  end
  
  def test_num_of_phase_for_5_teams
    n = @factory.num_of_phases 5
    assert_equal(3, n)
  end
  
  def test_num_of_phase_for_8_teams
    n = @factory.num_of_phases 8    
    assert_equal(3, n)
  end
  
  def test_num_of_phase_for_16_teams
    n = @factory.num_of_phases 16    
    assert_equal(4, n)
  end
  
  def test_fill_teams_for_3_teams
    t = @factory.fill_teams create_teams(3)
    assert_equal(4, t.size)
  end
  
  def test_fill_teams_for_5_teams
    t = @factory.fill_teams create_teams(5)
    assert_equal(8, t.size)
  end
  
  def test_fill_teams_for_11_teams
    t = @factory.fill_teams create_teams(11)
    assert_equal(16, t.size)
  end
  
  private
  def create_teams num_teams
    (1..num_teams).collect{|i| Team.new :name=>"time#{i}"}
  end
end