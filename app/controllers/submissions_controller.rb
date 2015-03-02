class SubmissionsController < ApplicationController
	def new
		@um_songs = Song.where(:song_artist => ["Umphrey's McGee", "Ali Baba's Tahini", "Karl Engelmann"]).map {|x| x.song_name}
		@cover_songs = Song.where.not(:song_artist => ["Umphrey's McGee", "Ali Baba's Tahini", "Karl Engelmann"]).map {|x| "#{x.song_name} by #{x.song_artist}"}
		@upcoming_shows = Show.where(:is_graded => false).map {|x| "#{x.date_of_show}: #{x.show_city}, #{x.show_state}"}
	end

	def create	
		# shouldn't render view; for now, let's just render the stuff
		render plain: params[:submission].inspect
	end
end
