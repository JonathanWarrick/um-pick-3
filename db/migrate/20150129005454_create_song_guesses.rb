class CreateSongGuesses < ActiveRecord::Migration
  def change
    create_table :song_guesses do |t|

      t.timestamps null: false
    end
  end
end
