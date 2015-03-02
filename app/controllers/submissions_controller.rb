class SubmissionsController < ApplicationController
	def new		
		@um_songs = Song.where(:song_artist => ["Umphrey's McGee", "Ali Baba's Tahini", "Karl Engelmann"]).map {|x| x.song_name}
		@cover_songs = Song.where.not(:song_artist => ["Umphrey's McGee", "Ali Baba's Tahini", "Karl Engelmann"]).map {|x| x.song_name}
		@upcoming_shows = Show.where(:is_graded => false).map {|x| x.date_of_show}
	end

	def create	
		# shouldn't render view; for now, let's just render the stuff
		render plain: params[:submission].inspect
		puts params
		puts "HEYYYYYYYY #{@submission}"
		@user ||= User.first
		# binding.pry
		@submission = @user.submissions.create({:show_id => Show.find_by_date_of_show(params[:submission][:date_of_show]).id})
		@submission.guesses.create({:song_id => Song.find_by_song_name(params[:submission][:guess1]).id, :is_opener => true})
		@submission.guesses.create({:song_id => Song.find_by_song_name(params[:submission][:guess2]).id})
		@submission.guesses.create({:song_id => Song.find_by_song_name(params[:submission][:guess3]).id})
		@submission.guesses.create({:song_id => Song.find_by_song_name(params[:submission][:cover]).id, :is_cover => true})
	end
end
