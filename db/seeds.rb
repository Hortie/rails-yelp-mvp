# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Restaurant.destroy_all
Review.destroy_all

10.times do
  name = Faker::University.name
  phone_number = Faker::PhoneNumber.phone_number
  address = Faker::Address.street_address
  category = ["chinese", "italian", "japanese", "french", "belgian"].sample
  Restaurant.create(name:name, phone_number: phone_number, address: address, category: category)
end


50.times do
  rating = (0..5).to_a.sample
  content = Faker::Lorem.paragraph
  id = (1..10).to_a.sample
  rr = Review.new(content:content, rating: rating)
  rr.restaurant = Restaurant.find(id)
  rr.save
end

