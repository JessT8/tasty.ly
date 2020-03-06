class FoodsUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :foods_users do |t|
      t.references :foods
      t.references :users
    end
  end
end