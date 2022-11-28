class RentalsController < ApplicationController

  def booked_cars
    @booked_cars = current_user.rentals
  end

  def rented_cars
  end

  def show
  end

  def new
  end

  def create
  end

  def edit
  end

  def update
  end

  def destroy
  end
end
