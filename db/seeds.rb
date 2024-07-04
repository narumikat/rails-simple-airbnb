# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

puts 'Cleaning data base...'

Flat.destroy_all

puts 'Creating flats...'

flats = []

20.times do |flat|
flats << Flat.create!(
  name: Faker::Lorem.sentence(word_count: 4),
  address: Faker::Locations::Australia.location,
  description: Faker::Lorem.sentence(word_count: 30),
  price_per_night: rand(2000..45000),
  number_of_guests: rand(1..10)
)
end

puts 'Flats created!'