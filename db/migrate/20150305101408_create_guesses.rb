class CreateGuesses < ActiveRecord::Migration
  def change
    create_table :guesses do |t|

      t.boolean :correct, default: false

      t.belongs_to :card, index: true
      t.belongs_to :round, index: true
    end
  end
end
