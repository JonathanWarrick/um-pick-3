class Show < ActiveRecord::Base
	has_many :song_shows
	has_many :songs, :through => :song_shows
end
