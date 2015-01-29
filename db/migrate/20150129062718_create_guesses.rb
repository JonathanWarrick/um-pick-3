class CreateGuesses < ActiveRecord::Migration
  def change
    create_table :guesses do |t|
      t.integer :submission_id
      t.integer :song_id

      t.timestamps null: false
    end
    add_index :guesses, :submission_id
    add_index :guesses, :song_id
    add_index :guesses, [:submission_id, :song_id], unique: true
  end
end
