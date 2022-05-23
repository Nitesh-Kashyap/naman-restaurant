class DishesController < ApplicationController
  before_action :check_user, except: [:index, :show, :add_review, :review] 
  before_action :set_dish, only: [:update, :edit, :show, :destroy]


  def index
    @dishes = Dish.all
  end

  def new
    @dish = Dish.new
  end

  def create
    @dish = Dish.new(dish_params)
    if @dish.save
      redirect_to dish_path(@dish)
    else
      render :new 
    end
  end

  def edit  
  end

  def update
    @dish.update(dish_params)

    redirect_to dish_path(@dish)
  end

  def show
  end

  def destroy
    @dish.destroy

    redirect_to dishes_path
  end

  def add_review
    @restaurant_dish = RestaurantDish.find_by(id: params[:dish_id])
  end

  def review
    @restaurant_dish = RestaurantDish.find_by(id: params[:dish_id])
    @restaurant_dish.reviews.create(comment: params[:comment], user_id: current_user.id)
    redirect_back(fallback_location: root_path)
  end


  private

  def dish_params
    params.require(:dish).permit(:name)
  end

  def set_dish
    @dish = Dish.find_by(id: params[:id])
  end

  def check_user
    unless current_user.is_admin?
      redirect_to restaurants_path, notice: "You Don't have enough permission to perform this action"
    end
  end
end
