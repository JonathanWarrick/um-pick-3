class ShowsController < ApplicationController
	def index
		@shows = Show.all.order(:date_of_show => :asc)
	end

	def show
		@show = Show.find(params[:id])
	  @submissions = @show.submissions.where(:show_id => @show.id)
	  @songs = Song.all
	end
end
