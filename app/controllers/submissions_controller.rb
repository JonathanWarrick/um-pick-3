class SubmissionsController < ApplicationController
	def new
		@date_of_show = params[:date]
		@um_songs = Song.where(:song_artist => ["Umphrey's McGee", "Ali Baba's Tahini", "Karl Engelmann"]).map {|x| x.song_name}
		@cover_songs = Song.where.not(:song_artist => ["Umphrey's McGee", "Ali Baba's Tahini", "Karl Engelmann"]).map {|x| x.song_name}	
		@cover_songs.unshift("No Cover")
		@cover_songs.unshift("New Cover")
	end

	def create	
		# shouldn't render view; for now, let's just render the stuff
		@user = current_user

		if songs_different? && songs_valid?
			@submission = @user.submissions.create({:show_id => Show.find_by_date_of_show(params[:date_of_show]).id})
			@submission.guesses.create({:song_id => Song.find_by_song_name(params[:submission][:guess1]).id, :is_opener => true})
			@submission.guesses.create({:song_id => Song.find_by_song_name(params[:submission][:guess2]).id})
			@submission.guesses.create({:song_id => Song.find_by_song_name(params[:submission][:guess3]).id})
			@submission.guesses.create({:song_id => Song.find_by_song_name(params[:submission][:cover]).id, :is_cover => true})
			redirect_to @user
		else 
			if !songs_different?
				flash[:danger] = "Please submit different choices for each guess."
				redirect_to new_submission_path(:date => params[:date])
			end
			if !songs_valid?
				flash[:danger] = "Please submit valid choices for each guess."
				redirect_to new_submission_path(:date => params[:date])
			end
		end
	end

	def update
		@user = current_user
		
		if songs_different? && songs_valid?
			@submission = Submission.find(params[:id])
			@guesses = @submission.guesses.order(is_opener: :desc, is_cover: :asc)
			@guesses[0].update(song_id: Song.find_by_song_name(params[:submission][:guess1]).id)
			@guesses[1].update(song_id: Song.find_by_song_name(params[:submission][:guess2]).id)
			@guesses[2].update(song_id: Song.find_by_song_name(params[:submission][:guess3]).id)
			@guesses[3].update(song_id: Song.find_by_song_name(params[:submission][:cover]).id)
			redirect_to @user
		else 
			if !songs_different?
				flash[:danger] = "Please submit different choices for each guess."
				redirect_to edit_submission_path(:id => params[:id])
			end
			if !songs_valid?
				flash[:danger] = "Please submit valid choices for each guess."
				redirect_to edit_submission_path(:id => params[:id])
			end
		end
	end

	def choose_show
		@user = current_user
		@upcoming_shows = Show.where(:is_graded => false).map { |x| "#{x.date_of_show.strftime("%m/%d/%Y")} - #{x.show_city}, #{x.show_state}" }
	end

	def new_or_existing
		@user = current_user
		@show = params[:submission][:date_of_show][0..9]
		@submitted_guesses = @user.submitted_guesses(@show)
		if @submitted_guesses.nil?
			redirect_to new_submission_path(:date => @show)
		else
			redirect_to edit_submission_path(:id => @submitted_guesses.id)
		end
	end

	def edit
		@submission = Submission.find(params[:id])
		@guesses = @submission.guesses.order(is_opener: :desc, is_cover: :asc)
		@date_of_show = params[:date]
		@um_songs = Song.where(:song_artist => ["Umphrey's McGee", "Ali Baba's Tahini", "Karl Engelmann"]).map {|x| x.song_name}
		@cover_songs = Song.where.not(:song_artist => ["Umphrey's McGee", "Ali Baba's Tahini", "Karl Engelmann"]).map {|x| x.song_name}	
		@cover_songs.unshift("No Cover")
		@cover_songs.unshift("New Cover")
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
