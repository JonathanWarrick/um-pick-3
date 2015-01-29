class DropGuessesTable < ActiveRecord::Migration
  def change
  	drop_table :guesses
  end
end
