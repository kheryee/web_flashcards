class CreateCards < ActiveRecord::Migration
  def change
    create_table :cards do |t|
      t.string :question, :answer

      t.belongs_to :deck, index: true
    end
  end
end
