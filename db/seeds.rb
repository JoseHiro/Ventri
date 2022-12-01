# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
places = ["Av. Niños Heroes 132, Doctores, Cuauhtémoc, 06720 Ciudad de México, CDMX", "Calle Dr Márquez 150, Doctores, Cuauhtémoc, Ciudad de México, CDMX"]
5.times do
  user1 = User.create(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, email: Faker::Internet.email, password: "123456")
  user2 = User.create(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, email: Faker::Internet.email, password: "123456")
  car = Car.new(category: Faker::Vehicle.car_type, brand: Faker::Vehicle.manufacture, model: Faker::Vehicle.model, year: Faker::Vehicle.year, color: Faker::Vehicle.color, number_of_seats: (1..5).to_a.sample, number_of_doors: Faker::Vehicle.doors, engine_size: Faker::Vehicle.engine_size, address: places.sample, price: (100..1000).to_a.sample)
  rental = Rental.new(start_date: Faker::Date.forward(days: 1), end_date: Faker::Date.forward(days: 5))
  car.owner = user1
  car.save
  rental.user = user2
  rental.car = car
  rental.save
end
