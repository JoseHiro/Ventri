Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"

  resources :cars do
    resources :rentals, only: [:new, :create]
  end
  resources :rentals, except: [:new, :create, :index]

  get "my_bookings", to: "rentals#booked_cars"
  get "my_rented_cars", to: "rentals#rented_cars"

  resources :rentals do
    resources :reviews
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
