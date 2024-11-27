class RestaurantsController < ApplicationController
  # before_action :set_restaurant, only: [:show, :new]
  def show
    @restaurant = Restaurant.find(params[:id])
    @reviews = @restaurant.reviews
    @review = @restaurant.reviews.new
  end

  def new
    @restaurant = Restaurant.new
  end

  def create
    @restaurant = Restaurant.create(restaurant_params)
    if @restaurant.save
      redirect_to restaurant_path(@restaurant), notice: "Restaurant was successfully created."
    else
      render :new
    end
  end

  def index
    @restaurants = Restaurant.all
  end

  private

  def restaurant_params
    params.require(:restaurant).permit(:name, :address, :category)
  end

  # def set_restaurant
  #   @restaurant = Restaurant.find(params[:id])
  # end

end
