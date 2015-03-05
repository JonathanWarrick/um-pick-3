class AddTimeOfShowToShows < ActiveRecord::Migration
  def change
    add_column :shows, :time_of_show, :time
    change_column :shows, :show_country, :string, default: 'USA'
    change_column :shows, :songs_played, :text, array: true, default: []
  end
end
