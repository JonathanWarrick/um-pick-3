class AddAtuLinkToShows < ActiveRecord::Migration
  def change
  	add_column :shows, :atu_link, :text
  end
end
