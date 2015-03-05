class AddMoreShitToTables < ActiveRecord::Migration
  def change
  	add_column :shows, :has_happened, :boolean, default: false
  	add_column :guesses, :is_correct, :boolean, default: false
  	add_column :song_shows, :is_opener, :boolean, default: false
  end
end
