class SubmissionsController < ApplicationController
	def new		
		@um_songs = Song.where(:song_artist => ["Umphrey's McGee", "Ali Baba's Tahini", "Karl Engelmann"]).map {|x| x.song_name}
		@cover_songs = Song.where.not(:song_artist => ["Umphrey's McGee", "Ali Baba's Tahini", "Karl Engelmann"]).map {|x| x.song_name}
		@upcoming_shows = Show.where(:is_graded => false).map {|x| x.date_of_show}
		@cover_songs.unshift("No Cover")
		@cover_songs.unshift("New Cover")
	end

	def create	
		# shouldn't render view; for now, let's just render the stuff
		@user = current_user

		if songs_different? && songs_valid?
			@submission = @user.submissions.create({:show_id => Show.find_by_date_of_show(params[:submission][:date_of_show]).id})
			@submission.guesses.create({:song_id => Song.find_by_song_name(params[:submission][:guess1]).id, :is_opener => true})
			@submission.guesses.create({:song_id => Song.find_by_song_name(params[:submission][:guess2]).id})
			@submission.guesses.create({:song_id => Song.find_by_song_name(params[:submission][:guess3]).id})
			@submission.guesses.create({:song_id => Song.find_by_song_name(params[:submission][:cover]).id, :is_cover => true})
			redirect_to @user
		else 
			if !songs_different?
				flash[:danger] = "Please submit different choices for each guess."
				redirect_to new_submission_path
			end
			if !songs_valid?
				flash[:danger] = "Please submit valid choices for each guess."
				redirect_to new_submission_path
			end
		end
	end

	private
	  def songs_different?
	  	params[:submission][:guess1] != params[:submission][:guess2] && 
	  	params[:submission][:guess1] != params[:submission][:guess3] && 
	  	params[:submission][:guess2] != params[:submission][:guess3] ? true : false
	  end

	  def songs_valid?
	  	[params[:submission][:guess1], params[:submission][:guess2], params[:submission][:guess3], params[:submission][:cover]].map do |guess|
	  		Song.find_by_song_name(guess)
	  	end.include?(nil) ? false : true
	  end
end
