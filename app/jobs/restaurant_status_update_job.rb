class RestaurantStatusUpdateJob < ApplicationJob
  queue_as :default

  def perform(restaurant, status)
    restaurant.update(status: status)
  end
end
