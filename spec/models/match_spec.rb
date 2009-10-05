require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe Match do
  #fixtures :matches, :teams

  
  it "should be valid with home and visitor teams" do
    match = create_match
    match.should be_valid
  end
  
  it "should be valid invalid without home team" do
    match = create_match
    match.home = nil
    
    match.should_not be_valid
  end  

  it "shold be valid invalid without visitor team" do
    match = create_match
    match.visitor = nil
    
    match.should_not be_valid
  end  

  it "'s winner should be home team if home team scores higher" do
    match = create_match
    
    match.home_score = 2
    match.visitor_score =1
    
    match.winner.name.should == 'Corinthians'
  end

  it "'s winner should be visitor team if visitor team scores higher" do
    match = create_match
    
    match.home_score = 0
    match.visitor_score =3
    
    match.winner.name.should == 'Santos'
  end
  
  it "should be a draw, if home team scores like visitor team" do
    match = create_match
    
    match.home_score = 2
    match.visitor_score = 2 
    
    match.should be_draw   
  end

  private
  
  def create_match
    Match.new({:home=> Factory(:corinthians), :visitor => Factory(:santos)})
  end
end
