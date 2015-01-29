class AddFieldsToShow < ActiveRecord::Migration
  def change
    add_column :shows, :date_of_show, :datetime
    add_column :shows, :location_of_show, :string
  end
end
