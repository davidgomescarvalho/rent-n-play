require 'faker'

puts "Seeding the database..."
puts "Creating users..."
# Create a user
10.times do
  User.create!(
    email: Faker::Internet.unique.email,
    password: Faker::Internet.unique.password,
    first_name: Faker::Name.unique.first_name,
    last_name: Faker::Name.unique.last_name
  )
end
puts "Created #{User.count} users."

puts "Creating posts..."
# Create a post
20.times do
  Post.create!(
    title: Faker::Music.instrument,
    body: Faker::Lorem.paragraph,
    category: Faker::Music.instrument,
    price: Faker::Number.decimal(l_digits: 2),
    photo: Faker::LoremFlickr.image,
    user: User.all.sample
  )
end
puts "Created #{Post.count} posts."

puts "Done seeding the database."
