class Restaurant < ApplicationRecord
	has_many :restaurant_dishes, dependent: :destroy
  has_many :dishes, through: :restaurant_dishes, dependent: :destroy
  has_many :reviews, as: :reviewable, dependent: :destroy
  enum status: ["open","closed"]

  def self.search(condition)
  	if condition.present?
      where("restaurants.name like ?", "%#{condition}%")
    else
    	self.all
    end
  end
end
