class FixColumnNameInSongs < ActiveRecord::Migration
  def change
  	rename_column :songs, :last_played_dated, :last_played_date
  end
end
