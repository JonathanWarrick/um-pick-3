class Song < ActiveRecord::Base
	has_many :song_shows
	has_many :shows, :through => :song_shows

	has_many :song_guesses
	has_many :guesses, :through => :song_guesses
end
