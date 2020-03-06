class CreateRestaurants < ActiveRecord::Migration[6.0]
  def change
    create_table :restaurants do |t|
      t.string :name
      t.text :image_url
      t.text :decription
      t.belongs_to :owner, null: false, foreign_key: true

      t.timestamps
    end
  end
end
