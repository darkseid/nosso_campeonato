require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe "ScoreComputing" do
	
	context "in a '3-1-0' system" do
		
		specify "should give 3 points to the winner" do
			
			m = Match.new({:home_team => Team.new({:name => 'corinthians'}), :foreign_team => Team.new({:name => 'santos'})})
			m.home_team_score = 1
			m.home_team_score = 0			
			
			ScoringHelper.compute_scoring m
			
			m.home_team.should have(3).points
			m.foreign_team.should have(0).points
			
			
		end
		
	end
	
end
