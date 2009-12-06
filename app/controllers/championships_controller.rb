class ChampionshipsController < ApplicationController
	
	def index
		@championships = Championship.find :all
  end
	
	def new
		@championship = Championship.new
	end
	
	def create
		@championship = Championship.new(params[:championship])
		render :page_1
	end
	
	def page_2
		@teams = []
		params[:teams].each do |key, team_name|
			t = Team.create({:name => team_name})
			@teams << t
		end
		
		@championship = PlayoffBuilder.new.build_championship @teams, params[:championship]['name']
    redirect_to(championship_path(@championship))
	end
	
	def show
		@championship = Championship.find params[:id]
	end
	
	def next_phase
	  @championship = Championship.find params[:id]
	  @championship.next_phase
    redirect_to(championship_path(@championship))
	end
	
end
