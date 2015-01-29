class AddIdsToSongShow < ActiveRecord::Migration
  def change
  	create_table song_shows do |t|
  		t.integer :song_id
  		t.integer :show_id

  		t.timestamps null: false
  	end
  	add_index: :song_shows, :song_id
  	add_index: :song_shows, :show_id
  	add_index: :song_shows, [:song_id, :show_id], unique: true
  end
end
