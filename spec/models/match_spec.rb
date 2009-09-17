require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe Match do
  fixtures :matches, :teams
  
  before(:each) do
    @valid_attributes = {:home_team_id => teams(:corinthians).id, :foreign_team_id => teams(:palmeiras).id}
  end
  
  it "should be valid with home and visitor teams" do
    match = create_match
    match.should be_valid
  end
  
  it "should be valid invalid without home team" do
    match = create_match
    match.home_team = nil
    
    match.should_not be_valid
  end  

  it "shold be valid invalid without visitor team" do
    match = create_match
    match.foreign_team = nil
    
    match.should_not be_valid
  end  

  it "'s winner should be home team if home team scores higher" do
    match = create_match
    
    match.home_team_score = 2
    match.foreign_team_score =1
    
    match.winner.name.should == 'corinthians'
  end

  it "'s winner should be visitor team if visitor team scores higher" do
    match = create_match
    
    match.home_team_score = 0
    match.foreign_team_score =3
    
    match.winner.name.should == 'santos'
  end
  
  it "should be a draw, if home team scores like visitor team" do
    match = create_match
    
    match.home_team_score = 2
    match.foreign_team_score = 2 
    
    match.should be_draw   
  end

  private
  
  def create_match
    Match.new({:home_team => teams(:corinthians), :foreign_team => teams(:santos)})
  end
end
