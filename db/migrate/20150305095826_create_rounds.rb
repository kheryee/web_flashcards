class CreateRounds < ActiveRecord::Migration
  def change
    create_table :rounds do |t|
      t.integer :count, default: 0

      t.belongs_to :deck, index: true
    end
  end
end
