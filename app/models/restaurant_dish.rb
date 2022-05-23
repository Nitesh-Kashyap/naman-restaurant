class RestaurantDish < ApplicationRecord
  require 'csv'
  validates :dish_id, presence: true
  validates_uniqueness_of :dish_id, scope: :restaurant_id
  belongs_to :restaurant
  belongs_to :dish
  has_many :reviews, as: :reviewable

  def self.to_csv list
    attributes = %w{id name price}
    CSV.generate(encoding: 'UTF-8') do |csv|
      csv << attributes
      list.each do |dish|
        csv << attributes.map{ |attr| dish.send(attr) }
      end
    end
  end

  def name
    self.dish.try(:name)
  end
end
