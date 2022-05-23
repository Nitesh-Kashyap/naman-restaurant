class AddStatusToRestaurants < ActiveRecord::Migration[7.0]
  def change
    add_column :restaurants, :status, :integer, default: 0
  end
end
