# Collect all image file paths in the `db/images/airbnb-images` directory
image_files = Dir.glob('db/images/airbnb-images/*')

# Create a default user if not already available
user = User.first || User.create!(
  email: "abk223@gmail.com",
  password: 'password',
  password_confirmation: 'password'
)

6.times do |i|
  property = Property.create!({
    name: Faker::Lorem.unique.sentence(word_count: 3),
    description: Faker::Lorem.unique.paragraph(sentence_count: 2),
    headline: Faker::Lorem.unique.sentence(word_count: 3),
    address_1: Faker::Address.unique.street_address,
    address_2: Faker::Address.unique.secondary_address,
    city: Faker::Address.unique.city,
    state: Faker::Address.unique.state,
    country: Faker::Address.unique.country,
    price: Money.from_amount((50...100).to_a.sample, 'USD'),
  })

  # Attach images to the property
  [i, i + 6].each do |image_index|
    if image_files[image_index]
      begin
        property.images.attach(io: File.open(image_files[image_index]), filename: File.basename(image_files[image_index]))
      rescue => e
        puts "Error attaching image #{image_files[image_index]}: #{e.message}"
      end
    end
  end

  # Create reviews for the property
  rand(5..10).times do
    Review.create!({
      content: Faker::Lorem.paragraph(sentence_count: 10),
      cleanliness_rating: rand(1..5),
      accuracy_rating: rand(1..5),
      checkin_rating: rand(1..5),
      communication_rating: rand(1..5),
      location_rating: rand(1..5),
      value_rating: rand(1..5),
      property: property,
      user: user
    })
  end
end
