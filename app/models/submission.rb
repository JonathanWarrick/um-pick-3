class Submission < ActiveRecord::Base
	belongs_to :user
	belongs_to :show

	has_many :guesses, dependent: :destroy
	has_many :songs, :through => :guesses	
end
