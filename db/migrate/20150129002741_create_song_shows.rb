class CreateSongShows < ActiveRecord::Migration
  def change
    create_table :song_shows do |t|

      t.timestamps null: false
    end
  end
end
