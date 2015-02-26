class AddColumnsToGuesses < ActiveRecord::Migration
  def change
  	add_column :guesses, :is_cover, :boolean, default: false
  	add_column :guesses, :is_opener, :boolean, default: false
  end
end
