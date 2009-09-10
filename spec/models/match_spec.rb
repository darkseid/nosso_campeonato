require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe Match do
  before(:each) do
    @valid_attributes = {:home_team => Team.create({:name => 'corinthians'}), :foreign_team => Team.create({:name => 'santos'})}
  end

  it "should create a new instance given valid attributes" do
    Match.create!(@valid_attributes)
  end

  it "should invert the match when needed" do


    m = Match.create(@valid_attributes)
    m.invert.home_team.should == m.foreign_team

  end

end
