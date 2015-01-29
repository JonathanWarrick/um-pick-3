class Song < ActiveRecord::Base
	has_many :song_shows
	has_many :shows, :through => :song_shows
end
