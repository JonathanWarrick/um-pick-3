class DropSongGuessesTable < ActiveRecord::Migration
  def change
  	drop_table :song_guesses
  end
end
