class ChampionshipController < ApplicationController
	
	def index
  end
	
	def new
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
			t = Team.create({:name => team_name})
			@teams << t
		end
		
		@c = PlayoffFactory.new.build_championship @teams
		puts "New record? #{@c.new_record?}"
		@c.name = session[:championship].name

		
		
		
	end
	
end
