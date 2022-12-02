class CarsController < ApplicationController
  def index
    @cars = Car.all
    @markers = @cars.geocoded.map do |car|
      {
        lat: car.latitude,
        lng: car.longitude,
        info_window: render_to_string(partial: "car_info_window", locals: { car: car})
      }
    end
  end

  def new
    @car = Car.new
  end

  def create
    @car = Car.new(car_params)
    @car.owner = current_user
    if @car.save
      redirect_to @car
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
    @rental = Rental.new
    @car = Car.find(params[:id])
    @markers = [{
      lat: @car.latitude,
      lng: @car.longitude
    }]
  end

  def edit
    @car = Car.find(params[:id])
  end

  def update
    @car = Car.find(params[:id])
    if @car.update(car_params)
      redirect_to car_path(@car)
    else
      render :edit, :unprocessable_entity
    end
  end

  def destroy
    @car = Car.find(params[:id])
    @car.destroy
    redirect_to cars_path, status: :see_other
  end

  private

  def car_params
    params.require(:car).permit(:category, :brand, :model, :year, :color, :number_of_doors, :number_of_seats,
                                :engine_size, :price, :address, photos: [])
  end
end
