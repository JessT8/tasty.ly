class CreateFoods < ActiveRecord::Migration[6.0]
  def change
    create_table :foods do |t|
      t.string :name
      t.money :price
      t.belongs_to :restaurant, null: false, foreign_key: true
      t.timestamps
    end
  end
end