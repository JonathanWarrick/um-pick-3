class AddIdsToSongShows < ActiveRecord::Migration
  def change
    add_column :song_shows, :song_id, :integer
    add_column :song_shows, :show_id, :integer
    add_index :song_shows, :song_id
    add_index :song_shows, :show_id
    add_index :song_shows, [:song_id, :show_id], unique: true
  end
end
