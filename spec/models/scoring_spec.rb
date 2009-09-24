require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe "Scoring" do
  include ScoringHelper
	
	context " '3-1-0' strategy" do
		
		specify "should compute 3 points to the winner" do
			m = Match.new({:home_team => Team.new({:name => 'corinthians'}), :foreign_team => Team.new({:name => 'santos'})})
			m.home_team_score = 1
			m.foreign_team_score = 0			
			
			compute_scoring m
			
			m.home_team.points.should == 3					
		end
		
		specify "should compute 0 points to the looser" do
			m = Match.new({:home_team => Team.new({:name => 'corinthians'}), :foreign_team => Team.new({:name => 'santos'})})
			m.home_team_score = 1
			m.foreign_team_score = 0			
			
			compute_scoring m
			
			m.foreign_team.points.should == 0
		end

		specify "should compute 1 point to both team when draw" do
			m = Match.new({:home_team => Team.new({:name => 'corinthians'}), :foreign_team => Team.new({:name => 'santos'})})
			m.home_team_score = 3
			m.foreign_team_score = 3			
			
			compute_scoring m

			m.home_team.points.should == 1			
			m.foreign_team.points.should == 1
		end
		
	end
	
end
