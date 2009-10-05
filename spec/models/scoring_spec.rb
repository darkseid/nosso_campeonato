require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe "Scoring" do
  include ScoringHelper
	
	context " '3-1-0' strategy" do
		
		specify "should give 3 points to the winner" do
			
			m = create_match
			m.home_score = 1
			m.visitor_score = 0		
			m.done=true	
			
			compute_scoring m
			
			m.home.points.should == 3
			m.visitor.points.should == 0
		end

		specify "should give no points to the loser" do
			
			m = create_match
			m.home_score = 1
			m.visitor_score = 0			
			
			compute_scoring m
			
			m.visitor.points.should be_eql 0
		end

		specify "should give 1 point to each team in a draw match" do
			
			m = create_match
			m.home_score = 2
			m.visitor_score = 2			
			
			compute_scoring m
			
			m.home.points.should be_eql 1
			m.visitor.points.should be_eql 1			
		end

		
	end
	
	private
	def create_match
		Match.new({:home => Factory(:corinthians), :visitor => Factory(:gremio)})
	end
	
end
