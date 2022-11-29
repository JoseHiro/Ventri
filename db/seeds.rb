# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
Rental.destroy_all
Car.destroy_all
iskander = User.second
emilio = User.first
car = Car.new(category: "SUV", brand: "Honda", model: "CRV", year: 1999, color: "black", number_of_seats: 5, number_of_doors: 5, engine_size: 34)
car.owner = emilio
car.save
rental = Rental.new(start_date: Date.new, end_date: Date.new + 1)
rental.car = car
rental.user = iskander
rental.save
