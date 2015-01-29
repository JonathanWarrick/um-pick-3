class AddFieldsToSong < ActiveRecord::Migration
  def change
    add_column :songs, :song_name, :string
  end
end
