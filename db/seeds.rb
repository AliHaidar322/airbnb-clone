# Collect all image file paths in the `db/images/airbnb-images` directory
image_files = Dir.glob('db/images/airbnb-images/*')

6.times do |i|
  property = Property.create!({
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

  # Attach two images to each property if available
  if image_files[i]
    property.images.attach(io: File.open(image_files[i]), filename: File.basename(image_files[i]))
  end

  if image_files[i + 6] # Use the next set of images
    property.images.attach(io: File.open(image_files[i + 6]), filename: File.basename(image_files[i + 6]))
  end
end
