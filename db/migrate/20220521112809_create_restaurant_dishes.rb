class CreateRestaurantDishes < ActiveRecord::Migration[7.0]
  def change
    create_table :restaurant_dishes do |t|
      t.belongs_to :restaurant, null: false, foreign_key: true
      t.belongs_to :dish, null: false, foreign_key: true
      t.float :price

      t.timestamps
    end
  end
end
