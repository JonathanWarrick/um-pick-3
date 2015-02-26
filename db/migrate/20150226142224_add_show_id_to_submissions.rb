class AddShowIdToSubmissions < ActiveRecord::Migration
  def change
    add_column :submissions, :show_id, :integer
  end
end
