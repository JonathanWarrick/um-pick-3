class Guess < ActiveRecord::Base
	belongs_to :submission
	belongs_to :song
end
