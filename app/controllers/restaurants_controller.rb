class RestaurantsController < ApplicationController
  before_action :check_user, except: [:index, :show] 
  before_action :set_restaurant, only: [:update, :edit, :show, :destroy]

  def index
    @restaurants = Restaurant.all
  end

  def new
    @restaurant = Restaurant.new
  end

  def create
    @restaurant = Restaurant.new(restaurant_params)
    if @restaurant.save
      redirect_to restaurant_path(@restaurant)
    else
      render :new 
    end
  end

  def edit  
  end

  def update
    @restaurant.update(restaurant_params)
    RestaurantStatusUpdateJob.set(wait: 15.seconds).perform_later(@restaurant, params[:status])
    redirect_to restaurant_path(@restaurant)
  end

  def show
    @dishes = RestaurantDish.where(restaurant_id: @restaurant.id)
  end

  def destroy
    @restaurant.destroy

    redirect_to restaurants_path
  end

  def add_dish
    @restaurant = Restaurant.find_by(id: params[:restaurant_id])
  end

  def dishes
    @restaurant = Restaurant.find_by(id: params[:restaurant_id])
    @dish = Dish.find_by(id: params[:dish_id])
    RestaurantDish.create(restaurant_id: @restaurant.id, dish_id: @dish.id, price: params[:price])
    redirect_to restaurant_path(@restaurant)
  end

  def review
    @restaurant = Restaurant.find_by(id: params[:restaurant_id])
    @restaurant.reviews.create(comment: params[:comment], user_id: current_user.id)
    redirect_back(fallback_location: root_path)
  end


  private

  def restaurant_params
    params.require(:restaurant).permit(:name)
  end

  def set_restaurant
    @restaurant = Restaurant.find_by(id: params[:id])
  end

  def check_user
    unless current_user.is_admin?
      flash[:error] = "Sorry, You Are Not Authorized To Do This"
      redirect_to restaurants_path
    end
  end
end

