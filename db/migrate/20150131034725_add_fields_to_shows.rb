class AddFieldsToShows < ActiveRecord::Migration
  def change
    add_column :shows, :show_venue, :string
    add_column :shows, :show_city, :string
    add_column :shows, :show_state, :string
    add_column :shows, :show_country, :string
    add_column :shows, :songs_played, :text, array: true
    remove_column :shows, :location_of_show
  end
end
