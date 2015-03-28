class Song < ActiveRecord::Base
	has_many :song_shows, dependent: :destroy
	has_many :shows, :through => :song_shows

	has_many :guesses
	has_many :submissions, :through => :guesses
end
