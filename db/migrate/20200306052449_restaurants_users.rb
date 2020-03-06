class RestaurantsUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :restaurants_users do |t|
      t.references :restaurants
      t.references :users
    end
  end
end