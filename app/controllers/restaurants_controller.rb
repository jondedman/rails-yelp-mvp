# frozen_string_literal: true

class RestaurantsController < ApplicationController

  def index
    @restaurants = Restaurant.all
  end

  def show
    @restaurant = Restaurant.find(params[:id])
    @reviews = @restaurant.reviews
    @review = Review.new
  end

  def new
    @restaurant = Restaurant.new # Needed to instantiate the form_with
  end

  def create
      @restaurant = Restaurant.new(restaurant_params)
      if @restaurant.save
        redirect_to @restaurant, notice: "Restaurant was successfully created."
      else
        render :new
      end
    end

  def set_restaurant
    @restaurant = Restaurant.find(params[:id])
  end

  def restaurant_params
    params.require(:restaurant).permit(:name, :address, :category)
  end

end
