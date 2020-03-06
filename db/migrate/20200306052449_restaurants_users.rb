class RestaurantsUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :restaurants_users do |t|
      t.references :restaurant
      t.references :user
    end
  end
end