require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe Phase do
  
  before(:each) do
    @valid_attributes = {
      :championship_id => 1
    }
  end

  it "should belongs to a Championship" do
    Phase.create!(@valid_attributes)
  end
  
  context "With 1 match" do
  
    it "should be done, when all its matches were done" do
    
      p = Phase.new
      m = Factory(:match_one)
      m.done = true
      p.add_match m
    
      p.should be_done
    end
  end
  
  context "With 2 matches" do
  
    it "should be done, when all its matches were done" do
    
      p = Phase.new
      m = Factory(:match_one)
      m.done = true
      p.add_match m
    
      m = Factory(:match_two)
      m.done = true
      p.add_match m    
    
      p.should be_done
    end
    
    it "should create a new match for a single 4-teams championship" do

      p = Phase.new
      p.add_match Factory(:match_one)
      p.add_match Factory(:match_two)
      p.done

      next_phase = p.forward
      next_phase.matches.size.should == 1

      match = next_phase.matches[0]
      match.home.name.should be_eql Factory(:match_winners_1_2).home.name
      match.visitor.name.should be_eql Factory(:match_winners_1_2).visitor.name
      match.should_not be_done

    end    
  end   
  
  
end
