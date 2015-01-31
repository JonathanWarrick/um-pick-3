class AddFieldsToSongs < ActiveRecord::Migration
  def change
    add_column :songs, :song_artist, :string
    add_column :songs, :times_played, :integer
    add_column :songs, :debut_date, :datetime
    add_column :songs, :last_played_date, :datetime
  end
end
