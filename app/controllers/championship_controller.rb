class ChampionshipController < ApplicationController
	
	def index
		championship = Championship.new
		session[:championship] = championship
	end
	
	def page_1
		@num_teams = params[:num_teams]
		@championship = session[:championship]
		@championship.name = params[:championship_name]
	end
	
	def page_2
		@teams = []
		params[:teams].each do |key, team_name|
			t = Team.new
			t.name = team_name
			@teams << t
		end
		
		@c = ChampionshipFactory.build_championship @teams
		
		@c.name = session[:championship].name
		session[:championship] = @c		
		

	end
	
end
