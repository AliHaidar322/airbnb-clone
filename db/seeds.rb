# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

20.times do
  Property.create!({
    name: Faker::Lorem.unique.sentence(word_count: 3),
    description: Faker::Lorem.unique.paragraph(sentence_count: 2),
    headline:  Faker::Lorem.unique.sentence(word_count: 3),
    address_1: Faker::Address.unique.street_address,
    address_2: Faker::Address.unique.secondary_address,
    city: Faker::Address.unique.city,
    state: Faker::Address.unique.state,
    country: Faker::Address.unique.country,
    price: Money.from_amount((50...100).to_a.sample, 'USD'),
  })
end
