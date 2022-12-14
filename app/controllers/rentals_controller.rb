class RentalsController < ApplicationController

  def booked_cars
    @booked_cars = current_user.rentals
  end

  def my_rented_cars
    @rented_cars = owner_rented_cars
  end

  def show_booked_car
    @rental = Rental.find(params[:id])
    @markers = [{
      lat: @rental.car.latitude,
      lng: @rental.car.longitude
    }]
    @price = (@rental.end_date - @rental.start_date).to_i * @rental.car.price.to_i
    @days = (@rental.end_date - @rental.start_date).to_i
  end

  def show_owner_rental
    @rental = Rental.find(params[:id])
    @markers = [{
      lat: @rental.car.latitude,
      lng: @rental.car.longitude
    }]
    @price = (@rental.end_date - @rental.start_date).to_i * @rental.car.price.to_i
    @days = (@rental.end_date - @rental.start_date).to_i
  end

  def new
    @rental = Rental.new
    @car = Car.find(params[:car_id])
  end

  def create
    @rental = Rental.new(new_car_params)
    @car = Car.find(params[:car_id])
    @rental.car = @car
    @rental.user = current_user
    @rental.total_cost = ((@rental.end_date - @rental.start_date).to_i * @rental.car.price.to_i)
    if @rental.save
      redirect_to show_booked_rental_path(@rental)
    else
      render "cars/show", status: :unprocessable_entity
    end
  end

  def rental_receive
    @rental = Rental.find(params[:id])
  end

  def rental_return
    @rental = Rental.find(params[:id])
  end

  def owner_rental_deliver
    @rental = Rental.find(params[:id])
  end

  def owner_rental_receive
    @rental = Rental.find(params[:id])
  end

  def update
    @rental = Rental.find(params[:id])
    if @rental.update(new_car_params)
      if current_user == @rental.car.owner
        redirect_to show_owner_rental_path(@rental)
      else
        redirect_to show_booked_rental_path(@rental)
      end
    else
      render :show_owner_rental, status: :unprocessable_entity
    end
  end

  def destroy
    @rental = Rental.find(params[:id])
    @rental.destroy
  end

  def update_owner_acceptance
    @rental = Rental.find(params[:id])
    if @rental.update(owner_approval_params)
    redirect_to show_owner_rental_path(@rental)
    end
  end

  private

  def owner_rented_cars
    owner_rented_cars = []
    all_rentals = Rental.all
    all_rentals.each do |rental|
      owner_rented_cars << rental if rental.car.owner == current_user
    end
    return owner_rented_cars
  end

  def new_car_params
    params.require(:rental).permit(:owner_acceptance, :start_milage, :end_milage, :user_started_condition,
                                   :owner_started_condition, :user_end_condition, :owner_end_condition, :start_date,
                                   :end_date)
  end

  def owner_approval_params
    params.require(:rental).permit(:owner_acceptance)
  end
end
