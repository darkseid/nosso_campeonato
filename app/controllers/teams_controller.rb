class TeamsController < ApplicationController
	def new
		num_of_teams = params[:num_of_teams].to_i
		@teams = []
		(1..num_of_teams).each do |team|
			@teams << Team.new
		end
	end

	def create
		@teams = []
		params[:team].each do |key,value|
			@teams << Team.create(value)
		end
		ChampionshipsController.new.page_1
	end

end
