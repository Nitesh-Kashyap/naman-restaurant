class Restaurant < ApplicationRecord
	has_many :restaurant_dishes, dependent: :destroy
  	has_many :dishes, through: :restaurant_dishes, dependent: :destroy
  	has_many :reviews, as: :reviewable, dependent: :destroy
  	enum status: ["open","closed"]
end
