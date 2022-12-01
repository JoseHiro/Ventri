Rails.application.routes.draw do

  devise_for :users
  get 'users/show'
  root to: "pages#home"

  resources :users do
    resources :reviews
  end

  resources :cars do
    resources :rentals, only: [:new, :create]
  end

  get "my_bookings", to: "rentals#booked_cars"
  get "my_bookings/:id", to: "rentals#show_booked_car", as: "show_booked_rental"
  get "my_bookings/:id/receive", to: "rentals#rental_receive", as: "receive_rental"
  get "my_bookings/:id/return", to: "rentals#rental_return", as: "return_rental"
  get "my_rented_cars/:id/deliver", to: "rentals#owner_rental_deliver", as: "owner_deliver_rental"
  get "my_rented_cars/:id/receive", to: "rentals#owner_rental_receive", as: "owner_receive_rental"
  get "my_rented_cars", to: "rentals#my_rented_cars"
  get "my_rented_cars/:id", to: "rentals#show_owner_rental", as: "show_owner_rental"

  resources :rentals do

  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
