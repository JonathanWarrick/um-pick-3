class UpdateFieldsAcrossTables < ActiveRecord::Migration
  def change
  	add_column :submissions, :is_graded, :boolean, default: false
  	add_column :submissions, :submission_score, :integer, default: 0
  	add_column :shows, :is_graded, :boolean, default: false
  	add_column :users, :total_score, :integer, default: 0
  end
end
