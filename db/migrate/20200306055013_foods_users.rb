class FoodsUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :foods_users do |t|
      t.references :food
      t.references :user
    end
  end
end