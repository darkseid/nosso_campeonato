require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe Phase do
  fixtures :matches, :teams
  
  before(:each) do
    @valid_attributes = {
      :championship_id => 1
    }
  end

  it "should belongs to a Championship" do
    Phase.create!(@valid_attributes)
  end
  
  it "should create a new match for a single 4-teams championship" do
    
    p = Phase.new
    p.add_match matches(:one)
    p.add_match matches(:two)
    
    p.forward.home.name.should == matches(:three).home.name
    p.forward.visitor.name.should == matches(:three).visitor.name  
    
  end
  
  
end
