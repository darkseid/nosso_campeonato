require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe "Scoring" do
  include ScoringHelper
	
	context " '3-1-0' strategy" do
		
		specify "should give 3 points to the winner" do
			
			m = create_match
			m.home_team_score = 1
			m.foreign_team_score = 0			
			
			ScoringSystem.compute_scoring m
			
			m.home_team.points.should be_eql 3
			m.foreign_team.points.should be_eql 0
		end

		specify "should give no points to the loser" do
			
			m = create_match
			m.home_team_score = 1
			m.foreign_team_score = 0			
			
			ScoringSystem.compute_scoring m
			
			m.foreign_team.points.should be_eql 0
		end

		specify "should give 1 point to each team in a draw match" do
			
			m = create_match
			m.home_team_score = 2
			m.foreign_team_score = 2			
			
			ScoringSystem.compute_scoring m
			
			m.foreign_team.points.should be_eql 1
			m.foreign_team.points.should be_eql 1			
		end

		
	end
	
	private
	def create_match
		Match.new({:home_team => Team.new({:name => 'corinthians'}), :foreign_team => Team.new({:name => 'santos'})})
	end
	
end
