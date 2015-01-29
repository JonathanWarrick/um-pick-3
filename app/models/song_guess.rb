class SongGuess < ActiveRecord::Base
	belongs_to :song
	belongs_to :guess
end
