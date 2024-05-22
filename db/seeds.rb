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
  Instrument.create!(
    title: Faker::Music.instrument,
    body: Faker::Lorem.paragraph,
    category: Faker::Music.instrument,
    price: Faker::Number.decimal(l_digits: 2),
    photo: Faker::LoremFlickr.image(size: "50x60", search_terms: ['instruments'], match_all: true),
    user: User.all.sample
  )
end
puts "Created #{Instrument.count} posts."

puts "Creating bookings..."
# Create a booking
20.times do
  Booking.create!(
    start_date: Faker::Date.forward(days: 23),
    end_date: Faker::Date.forward(days: 30),
    status: ["pending", "accepted", "declined"].sample,
    user: User.all.sample,
    instrument: Instrument.all.sample
  )
end
puts "Created #{Booking.count} bookings."

puts "Done seeding the database."
