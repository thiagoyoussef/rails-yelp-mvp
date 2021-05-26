# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'faker'

puts "Cleaning database..."
Restaurant.destroy_all

puts "Creating restaurants..."

10.times do |_|
  restaurant_attributes = {
    name: Faker::Restaurant.name,
    address: Faker::Address.full_address,
    phone_number: Faker::PhoneNumber.phone_number_with_country_code,
    category: ["chinese", "italian", "japanese", "french", "belgian"].sample
  }
  new_restaurant = Restaurant.new(restaurant_attributes)
  new_restaurant.save

  review_attributes = {
    content: Faker::Restaurant.review,
    rating: (0..5).to_a.sample
  }

  review = Review.new(review_attributes)
  review.restaurant = new_restaurant
  review.save
end

puts "Finished!"
