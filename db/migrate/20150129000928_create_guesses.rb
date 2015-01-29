class CreateGuesses < ActiveRecord::Migration
  def change
    create_table :guesses do |t|
      t.references :submission, index: true

      t.timestamps null: false
    end
    add_foreign_key :guesses, :submissions
  end
end
