class CreateDecks < ActiveRecord::Migration
  def change
    create_table :decks do |x|
      x.string :name

      x.timestamps null: false
    end
  end
end
