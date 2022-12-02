class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home

  def home
    # @user = User.find(current_user.id)
    # @currnet_rental = Rental.find(current_user.id)
    @cars = Car.all
    # @cars.slice(0,4)
  end
end
