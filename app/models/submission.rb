class Submission < ActiveRecord::Base
	belongs_to :user

	has_many :guesses
	has_many :songs, :through => :guesses	
end
