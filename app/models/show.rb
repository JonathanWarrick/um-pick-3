class Show < ActiveRecord::Base
	has_many :song_shows, dependent: :destroy
	has_many :songs, :through => :song_shows

	has_many :submissions
end
