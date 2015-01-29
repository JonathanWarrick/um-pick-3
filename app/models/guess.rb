class Guess < ActiveRecord::Base
  belongs_to :submission

  has_many :song_guesses
	has_many :songs, :through => :song_guesses
end
