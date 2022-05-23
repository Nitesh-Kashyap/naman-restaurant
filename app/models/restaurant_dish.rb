class RestaurantDish < ApplicationRecord
  validates :dish_id, presence: true
  validates_uniqueness_of :dish_id, scope: :restaurant_id
  belongs_to :restaurant
  belongs_to :dish
  has_many :reviews, as: :reviewable
end
