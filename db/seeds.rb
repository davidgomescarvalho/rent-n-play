require 'faker'

# Clear existing data
Booking.destroy_all
User.destroy_all
Instrument.destroy_all
puts "Cleared the database."

# Seed the database
puts "Seeding the database..."
puts "Creating users..."

# Create a user
10.times do
  User.create!(
    email: Faker::Internet.email,
    password: 'password',
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    avatar: "https://thispersondoesnotexist.com/image"
  )
end
puts "Created #{User.count} users."

puts "Creating instruments..."
# Create a post
users = User.all
categories = ["String", "Percussion", "Wind", "Keyboard", "Electronic"]
locations = ["5 Avenue Anatole France, 75007 Paris, France", "Rue de Rivoli, 75001 Paris, France", "6 Parvis Notre-Dame - Pl. Jean-Paul II, 75004 Paris, France", "Place d'Armes, 78000 Versailles, France", "50170 Mont Saint-Michel, France", "70 Rue Saint-Jean, 69005 Lyon, France", "75004 Paris, France", "Château, 41250 Chambord, France", "Prom. des Anglais, 06000 Nice, France", "Pl. Stanislas, 54000 Nancy, France"]

20.times do |i|
  Instrument.create!(
    title: "#{Faker::Music.instrument} #{i}",
    body: Faker::Lorem.paragraph(sentence_count: 5),
    category: categories.sample,
    price: Faker::Commerce.price(range: 50..1000),
    photo: Faker::LoremFlickr.image(search_terms: ['instruments']),
    user: users.sample,
    location: locations.sample,
    availability: Faker::Date.forward(days: 30)
    )
end
puts "Created #{Instrument.count} instruments."

puts "Creating bookings..."
# Create a booking
instruments = Instrument.all
statuses = ["Pending", "Confirmed", "Cancelled"]

20.times do
  start_date = Faker::Date.forward(days: 30)
  end_date = start_date + rand(1..7).days

  Booking.create!(
    user: users.sample,
    instrument: instruments.sample,
    start_date: start_date,
    end_date: end_date,
    status: statuses.sample,
    total_price: rand(50..1000)
  )
end
puts "Created #{Booking.count} bookings."
puts "Seeded #{User.count} users, #{Instrument.count} instruments, and #{Booking.count} bookings."
puts "Done seeding the database."
