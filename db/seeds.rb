require 'faker'
require 'open-uri'

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
  user = User.create!(
    email: Faker::Internet.email,
    password: 'password',
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name
  )
  photo = URI.open(Faker::Avatar.image(size: "50x50", format: "jpg"))
  user.photo.attach(io: photo, filename: "#{user.first_name}.jpg", content_type: 'image/jpg')
  user.save!
end

puts "Created #{User.count} users."

puts "Creating instruments..."

# Create a post
users = User.all

locations = ["5 Avenue Anatole France, 75007 Paris, France", "Rue de Rivoli, 75001 Paris, France", "6 Parvis Notre-Dame - Pl. Jean-Paul II, 75004 Paris, France", "Place d'Armes, 78000 Versailles, France", "50170 Mont Saint-Michel, France", "70 Rue Saint-Jean, 69005 Lyon, France", "75004 Paris, France", "Château, 41250 Chambord, France", "Prom. des Anglais, 06000 Nice, France", "Pl. Stanislas, 54000 Nancy, France"]
availability = ["Yes", "No"]
before_title = ["Awesome", "Amazing", "Authentic", "Beautiful", "Classic", "Cool", "Elegant", "Fancy", "Fantastic", "Gorgeous", "Great", "Incredible", "Lovely", "Magnificent", "Marvelous", "Outstanding", "Perfect", "Remarkable", "Spectacular", "Stunning", "Superb", "Terrific", "Wonderful", "Wondrous"]
status = ["Pending", "Confirmed", "Cancelled"]

start_date = Faker::Date.forward(days: 30)
end_date = start_date + rand(1..7).days

# Create an instrument

#Electric guitar

guitar = Instrument.create!(
  title: before_title.sample + " " + "Gibson Les Paul",
  body: "The Gibson Les Paul is a solid body electric guitar that was first sold by the Gibson Guitar Corporation in 1952. The Les Paul was designed by Gibson president Ted McCarty, factory manager John Huis and their team with some input from and endorsement by guitarist Les Paul. Its design typically features a solid mahogany body with a carved maple top and a single cutaway, a mahogany set-in neck with a rosewood fretboard, two pickups with independent volume and tone controls, and a stoptail bridge, although variants exist.",
  category: "String",
  price: rand(50..300),
  user: users.sample,
  location: locations.sample,
  start_date: start_date,
  end_date: start_date + rand(1..7).days,
  availability: availability.sample
)


guitar.photos.attach(io: URI.open("https://images.unsplash.com/photo-1588885108221-776f24071e0b?q=80&w=1974&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D"), filename: "#{guitar.title}.jpg", content_type: 'image/jpg')
guitar.photos.attach(io: URI.open("https://images.unsplash.com/photo-1588885108193-db83d427eb4b?w=600&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8Z2lic29uJTIwbGVzJTIwcGF1bHxlbnwwfHwwfHx8MA%3D%3D"), filename: "#{guitar.title}.jpg", content_type: 'image/jpg')
guitar.photos.attach(io: URI.open("https://images.unsplash.com/photo-1616066959540-0dfbb4d7e00b?w=600&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8NHx8Z2lic29uJTIwbGVzJTIwcGF1bHxlbnwwfHwwfHx8MA%3D%3D"), filename: "#{guitar.title}.jpg", content_type: 'image/jpg')

Booking.create!(
  user: users.sample,
  instrument: guitar,
  start_date: start_date,
  end_date: start_date + rand(1..7).days,
  status: status.sample
)

eguitar = Instrument.create!(
  title: before_title.sample + " " +"Fender Stratocaster",
  category: "String",
  body: "The Fender Stratocaster is a model of electric guitar designed from 1952 into 1954 by Leo Fender, Bill Carson, George Fullerton and Freddie Tavares. The Fender Musical Instruments Corporation has continuously manufactured the Stratocaster from 1954 to the present. It is a double-cutaway guitar, with an extended top horn shape for balance. Along with the Gibson Les Paul and Fender Telecaster, it is one of the most-often emulated electric guitar shapes.",
  price: rand(50..300),
  user: users.sample,
  location: locations.sample,
  start_date: start_date,
  end_date: start_date + rand(1..7).days,
  availability: availability.sample
)

eguitar.photos.attach(io: URI.open("https://images.unsplash.com/photo-1613032970340-7846189c1cbe?w=600&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8M3x8ZmVuZGVyJTIwc3RyYXRvY2FzdGVyfGVufDB8fDB8fHww"), filename: "#{guitar.title}.jpg", content_type: 'image/jpg')
eguitar.photos.attach(io: URI.open("https://images.unsplash.com/photo-1606043357323-69163e39abfc?w=600&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8N3x8ZmVuZGVyJTIwc3RyYXRvY2FzdGVyfGVufDB8fDB8fHww"), filename: "#{guitar.title}.jpg", content_type: 'image/jpg')
eguitar.photos.attach(io: URI.open("https://images.unsplash.com/photo-1606041281659-3f2cec516ac0?w=600&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Nnx8ZmVuZGVyJTIwc3RyYXRvY2FzdGVyfGVufDB8fDB8fHww"), filename: "#{guitar.title}.jpg", content_type: 'image/jpg')

Booking.create!(
  user: users.sample,
  instrument: eguitar,
  start_date: start_date,
  end_date: start_date + rand(1..7).days,
  status: status.sample
)

eguitar3 = Instrument.create!(
  title: before_title.sample + " " +"Ibanez RG",
  category: "String",
  body: "The Ibanez RG is a series of electric guitars produced by Hoshino Gakki and one of the best-selling superstrat-style hard rock/heavy metal guitars ever made. The first in the series, RG550, was originally released in 1987 and advertised as part of the Roadstar series. The RG was created by Hoshino Gakki and is one of the original RG series models. The RG series is a line of solid body electric guitars produced by Hoshino Gakki and sold under the Ibanez brand. The first RG was introduced in 1987 as part of the Roadstar series, but it was called RG, the Roadstar guitar series having been discontinued in 1987.",
  price: rand(50..300),
  user: users.sample,
  location: locations.sample,
  start_date: start_date,
  end_date: start_date + rand(1..7).days,
  availability: availability.sample
  )

  eguitar3.photos.attach(io: URI.open("https://musiquedepot.ca/media/catalog/product/cache/149f0aa481ad7771b80b95504d65e04f/3/1/31519_ibanez_rg470ahmbmt_ibanez-rg470ahmbmt-acclaim-di4.jpg"), filename: "#{guitar.title}.jpg", content_type: 'image/jpg')
  eguitar3.photos.attach(io: URI.open("https://m.media-amazon.com/images/I/71w-Rd0JYbL._AC_UF1000,1000_QL80_.jpg"), filename: "#{guitar.title}.jpg", content_type: 'image/jpg')
  eguitar3.photos.attach(io: URI.open("https://cdn.shoplightspeed.com/shops/647176/files/62135872/650x650x2/ibanez-rg5120m-prestige-hh-fishman-fluence-guitar.jpg"), filename: "#{guitar.title}.jpg", content_type: 'image/jpg')

  Booking.create!(
    user: users.sample,
    instrument: eguitar3,
    start_date: start_date,
    end_date: start_date + rand(1..7).days,
    status: status.sample,
  )



#Acoustic guitar

aguitar1 = Instrument.create!(
  title: before_title.sample + " " +"Classical Guitar",
  category: "String",
  body: "The classical guitar (also known as the classic guitar, nylon-string guitar or Spanish guitar) is a member of the guitar family used in classical music. An acoustic wooden string instrument with strings made of gut or nylon, it is a precursor of the modern acoustic and electric guitars, both of which use metal strings. Classical guitars are derived from the Spanish vihuela and gittern in the fifteenth and sixteenth century, which later evolved into the seventeenth and eighteenth-century Baroque guitar and later the modern classical guitar in the mid-nineteenth century.",
  price: rand(50..300),
  user: users.sample,
  location: locations.sample,
  start_date: start_date,
  end_date: start_date + rand(1..7).days,
  availability: availability.sample
)
  aguitar1.photos.attach(io: URI.open("https://m.media-amazon.com/images/I/61zIszX+2YL.jpg"), filename: "#{aguitar1.title}.jpg", content_type: 'image/jpg')
  aguitar1.photos.attach(io: URI.open("https://upload.wikimedia.org/wikipedia/commons/3/37/Andrey_Ostapenko%2C_guitarist.jpg"), filename: "#{aguitar1.title}.jpg", content_type: 'image/jpg')
  aguitar1.photos.attach(io: URI.open("https://www.normans.co.uk/cdn/shop/articles/acoustic-vs-classical_7aa53ad4-bd8b-4b5e-94be-7cb6fde78a4b.jpg?v=1620932701"), filename: "#{aguitar1.title}.jpg", content_type: 'image/jpg')

  Booking.create!(
    user: users.sample,
    instrument: aguitar1,
    start_date: start_date,
    end_date: start_date + rand(1..7).days,
    status: status.sample,
  )


  aguitar2 = Instrument.create!(
    title: before_title.sample + " " +"Resonator Guitar",
    category: "String",
    body: "A resonator guitar or resophonic guitar is an acoustic guitar that produces sound by conducting string vibrations through the bridge to one or more spun metal cones (resonators) instead of to the guitar's sounding board (top). Resonator guitars were originally designed to be louder than regular acoustic guitars, which were overwhelmed by horns and percussion instruments in dance orchestras. They became prized for their distinctive tone, however, and found life with bluegrass music and the blues well after electric amplification solved the problem of inadequate guitar sound levels.",
    price: rand(50..300),
    user: users.sample,
    location: locations.sample,
    start_date: start_date,
    end_date: start_date + rand(1..7).days,
    availability: availability.sample
  )
  aguitar2.photos.attach(io: URI.open("https://plus.unsplash.com/premium_photo-1680527465661-0efe3379840f?w=600&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MXx8cmVzb25hdG9yJTIwZ3VpdGFyfGVufDB8fDB8fHww"), filename: "#{aguitar2.title}.jpg", content_type: 'image/jpg')
  aguitar2.photos.attach(io: URI.open("https://images.unsplash.com/photo-1520167112707-56e25f2d7d6e?w=600&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8cmVzb25hdG9yJTIwZ3VpdGFyfGVufDB8fDB8fHww"), filename: "#{aguitar2.title}.jpg", content_type: 'image/jpg')
  aguitar2.photos.attach(io: URI.open("https://images.unsplash.com/photo-1531907933630-126f527982d4?w=600&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTh8fHJlc29uYXRvciUyMGd1aXRhcnxlbnwwfHwwfHx8MA%3D%3D"), filename: "#{aguitar2.title}.jpg", content_type: 'image/jpg')

  Booking.create!(
    user: users.sample,
    instrument: aguitar2,
    start_date: start_date,
    end_date: start_date + rand(1..7).days,
    status: status.sample,
  )


#Drums

drums1 = Instrument.create!(
  title: before_title.sample + " " +"Drum Kit",
  category: "Percussion",
  body: "A drum kit — also called a drum set, trap set (an abbreviation of the word, 'contraption'), or simply drums — is a collection of drums and other percussion instruments, typically cymbals, which are set up on stands to be played by a single player, with drumsticks held in both hands, and the feet operating pedals that control the hi-hat cymbal and the beater for the bass drum. A drum kit consists of a mix of drums (categorized classically as membranophones, Hornbostel-Sachs high-level classification 2) and idiophones — most significantly cymbals, but can also include the woodblock and cowbell (classified as Hornbostel-Sachs high-level classification 1).",
  price: rand(50..300),
  user: users.sample,
  location: locations.sample,
  start_date: start_date,
  end_date: start_date + rand(1..7).days,
  availability: availability.sample
)
    drums1.photos.attach(io: URI.open("https://images.unsplash.com/photo-1519892300165-cb5542fb47c7?w=600&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8M3x8ZHJ1bXxlbnwwfHwwfHx8MA%3D%3D"), filename: "#{drums1.title}.jpg", content_type: 'image/jpg')
    drums1.photos.attach(io: URI.open("https://images.unsplash.com/photo-1543443258-92b04ad5ec6b?w=600&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8N3x8ZHJ1bXxlbnwwfHwwfHx8MA%3D%3D"), filename: "#{drums1.title}.jpg", content_type: 'image/jpg')
    drums1.photos.attach(io: URI.open("https://images.unsplash.com/photo-1602939444907-6e688c594a66?w=600&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTR8fGRydW18ZW58MHx8MHx8fDA%3D"), filename: "#{drums1.title}.jpg", content_type: 'image/jpg')

    Booking.create!(
      user: users.sample,
      instrument: drums1,
      start_date: start_date,
      end_date: start_date + rand(1..7).days,
      status: status.sample,
    )

drums2 = Instrument.create!(
  title: before_title.sample + " " +"Djembe Drum",
  category: "Percussion",
  body: "A djembe or jembe is a rope-tuned skin-covered goblet drum played with bare hands, originally from West Africa. According to the Bambara people in Mali, the name of the djembe comes from the saying 'Anke djé, anke bé' which translates to 'everyone gather together in peace' and defines the drum's purpose. In the Bambara language, 'djé' is the verb for 'gather' and 'bé' translates as 'peace'.",
  price: rand(50..300),
  user: users.sample,
  location: locations.sample,
  start_date: start_date,
  end_date: start_date + rand(1..7).days,
  availability: availability.sample
)
  drums2.photos.attach(io: URI.open("https://plus.unsplash.com/premium_photo-1663956132370-e6208392d8b1?w=600&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MXx8ZGplbWJlJTIwZHJ1bXN8ZW58MHx8MHx8fDA%3D"), filename: "#{drums2.title}.jpg", content_type: 'image/jpg')
  drums2.photos.attach(io: URI.open("https://images.unsplash.com/photo-1601977399206-84a2ebc75591?w=600&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTV8fGRqZW1iZSUyMGRydW1zfGVufDB8fDB8fHww"), filename: "#{drums2.title}.jpg", content_type: 'image/jpg')
  drums2.photos.attach(io: URI.open("https://images.unsplash.com/photo-1568219656418-15c329312bf1?w=600&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8NDd8fGRqZW1iZSUyMGRydW1zfGVufDB8fDB8fHww"), filename: "#{drums2.title}.jpg", content_type: 'image/jpg')

  Booking.create!(
    user: users.sample,
    instrument: drums2,
    start_date: start_date,
    end_date: start_date + rand(1..7).days,
    status: status.sample,
    )

  drums3= Instrument.create!(
    title: before_title.sample + " " +"Cajon Drum",
    category: "Percussion",
    body: "A cajón is a box-shaped percussion instrument originally from Peru, played by slapping the front or rear faces (generally thin plywood) with the hands, fingers, or sometimes implements such as brushes, mallets, or sticks. Cajones are primarily played in Afro-Peruvian music, as well as contemporary styles of flamenco and jazz among other genres. The term cajón is also applied to other box drums used in Latin American music such as the cajón de rumba used in Cuban rumba and the cajón de tapeo used in Mexican folk music.",
    price: rand(50..300),
    user: users.sample,
    location: locations.sample,
    start_date: start_date,
    end_date: start_date + rand(1..7).days,
    availability: availability.sample
  )

  drums3.photos.attach(io: URI.open("https://static.wixstatic.com/media/ac2700_2f434a85684a40bfabbcf8fb954a28ee~mv2.jpg/v1/fill/w_1600,h_1068,al_c/ac2700_2f434a85684a40bfabbcf8fb954a28ee~mv2.jpg"), filename: "#{drums3.title}.jpg", content_type: 'image/jpg')
  drums3.photos.attach(io: URI.open("https://i.ytimg.com/vi/z3POWYQFzfo/maxresdefault.jpg"), filename: "#{drums3.title}.jpg", content_type: 'image/jpg')
  drums3.photos.attach(io: URI.open("https://thumbs.static-thomann.de/thumb/padthumb600x600/pics/bdb/_44/445745/13397436_800.jpg"), filename: "#{drums3.title}.jpg", content_type: 'image/jpg')

  Booking.create!(
    user: users.sample,
    instrument: drums3,
    start_date: start_date,
    end_date: start_date + rand(1..7).days,
    status: status.sample,
  )

#Piano

piano1 = Instrument.create!(
  title: before_title.sample + " " +"Grand Piano",
  category: "Keyboard",
  body: "The grand piano is a large musical instrument that features a long, horizontal case with strings that run vertically. The strings are struck by hammers when the keys are pressed. The grand piano is used for Classical solos, chamber music, and art song, and it is often used in jazz and pop concerts. The grand piano is sometimes called a concert piano.",
  price: rand(50..300),
  user: users.sample,
  location: locations.sample,
  start_date: start_date,
  end_date: start_date + rand(1..7).days,
  availability: availability.sample
)

piano1.photos.attach(io: URI.open("https://plus.unsplash.com/premium_photo-1677503296916-478a17317cc2?w=600&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MXx8Z3JhbmQlMjBwaWFub3xlbnwwfHwwfHx8MA%3D%3D"), filename: "#{piano1.title}.jpg", content_type: 'image/jpg')
piano1.photos.attach(io: URI.open("https://images.unsplash.com/photo-1612016410921-264f6afed556?w=600&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Nnx8Z3JhbmQlMjBwaWFub3xlbnwwfHwwfHx8MA%3D%3D"), filename: "#{piano1.title}.jpg", content_type: 'image/jpg')
piano1.photos.attach(io: URI.open("https://images.unsplash.com/photo-1624088798012-7eabdb19cf90?w=600&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8M3x8Z3JhbmQlMjBwaWFub3xlbnwwfHwwfHx8MA%3D%3D"), filename: "#{piano1.title}.jpg", content_type: 'image/jpg')

Booking.create!(
  user: users.sample,
  instrument: piano1,
  start_date: start_date,
  end_date: start_date + rand(1..7).days,
  status: status.sample,
)

piano2 = Instrument.create!(
  title: before_title.sample + " " +"Upright Piano",
  category: "Keyboard",
  body: "The upright piano, also known as the vertical piano, is more compact because the frame and strings are vertical. Upright pianos are made in various heights. If you need a smaller piano, an upright piano is a good choice. The upright piano is popular in homes, schools, and churches. It is used in many music studios and practice rooms.",
  price: rand(50..300),
  user: users.sample,
  location: locations.sample,
  start_date: start_date,
  end_date: start_date + rand(1..7).days,
  availability: availability.sample
)

piano2.photos.attach(io: URI.open("https://plus.unsplash.com/premium_photo-1664106242861-a043688ad3a0?w=600&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MXx8dXByaWdodCUyMHBpYW5vfGVufDB8fDB8fHww"), filename: "#{piano2.title}.jpg", content_type: 'image/jpg')
piano2.photos.attach(io: URI.open("https://images.unsplash.com/photo-1560105358-02361fa27b2c?w=600&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8dXByaWdodCUyMHBpYW5vfGVufDB8fDB8fHww"), filename: "#{piano2.title}.jpg", content_type: 'image/jpg')
piano2.photos.attach(io: URI.open("https://images.unsplash.com/photo-1616877809047-d943e086b079?w=600&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8M3x8dXByaWdodCUyMHBpYW5vfGVufDB8fDB8fHww"), filename: "#{piano2.title}.jpg", content_type: 'image/jpg')

Booking.create!(
  user: users.sample,
  instrument: piano2,
  start_date: start_date,
  end_date: start_date + rand(1..7).days,
  status: status.sample,
)

piano3 = Instrument.create!(
  title: before_title.sample + " " +"Digital Piano",
  category: "Keyboard",
  body: "A digital piano is a modern electronic musical instrument designed to serve primarily as an alternative to a traditional acoustic piano, both in the way it feels to play and in the sound produced. Digital pianos use either synthesized emulation or recorded samples of an acoustic piano, which are then amplified through an internal loudspeaker. Digital pianos incorporate weighted keys, which recreate the feel of an acoustic piano.",
  price: rand(50..300),
  user: users.sample,
  location: locations.sample,
  start_date: start_date,
  end_date: start_date + rand(1..7).days,
  availability: availability.sample
)

piano3.photos.attach(io: URI.open("https://plus.unsplash.com/premium_photo-1681389284018-a138f7fd7de9?w=600&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MXx8ZGlnaXRhbCUyMHBpYW5vfGVufDB8fDB8fHww"), filename: "#{piano3.title}.jpg", content_type: 'image/jpg')
piano3.photos.attach(io: URI.open("https://images.unsplash.com/photo-1560665301-91a70ba3a9ea?w=600&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8ZGlnaXRhbCUyMHBpYW5vfGVufDB8fDB8fHww"), filename: "#{piano3.title}.jpg", content_type: 'image/jpg')
piano3.photos.attach(io: URI.open("https://images.unsplash.com/photo-1622707273464-9f108f2623b1?w=600&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8NHx8ZGlnaXRhbCUyMHBpYW5vfGVufDB8fDB8fHww"), filename: "#{piano3.title}.jpg", content_type: 'image/jpg')

Booking.create!(
  user: users.sample,
  instrument: piano3,
  start_date: start_date,
  end_date: start_date + rand(1..7).days,
  status: status.sample,
)

#Violin

violin1 = Instrument.create!(
  title: before_title.sample + " " +" Electronic Violin",
  category: "String",
  body: "An electric violin is a violin equipped with an electronic output of its sound. The term most properly refers to an instrument intentionally made to be electrified with built-in pickups, usually with a solid body. It can also refer to a violin fitted with an electric pickup of some type, although 'amplified violin' or 'electro-acoustic violin' are more accurate in that case.",
  price: rand(50..300),
  user: users.sample,
  location: locations.sample,
  start_date: start_date,
  end_date: start_date + rand(1..7).days,
  availability: availability.sample
)

violin1.photos.attach(io: URI.open("https://www.superprof.com.au/blog/wp-content/uploads/2018/02/how-to-play-electric-violins.jpg"), filename: "#{violin1.title}.jpg", content_type: 'image/jpg')
violin1.photos.attach(io: URI.open("https://img.kytary.com/eshop_fr/stredni_v4x/na/638252946566800000/62fb48c0/65121353/bacio-instruments-electric-violin-bk.jpg"), filename: "#{violin1.title}.jpg", content_type: 'image/jpg')
violin1.photos.attach(io: URI.open("https://img.kytary.com/eshop_fr/stredni_v4x/na/638252946514870000/d3cd0b8d/65121347/bacio-instruments-electric-violin-bk.jpg"), filename: "#{violin1.title}.jpg", content_type: 'image/jpg')

Booking.create!(
  user: users.sample,
  instrument: violin1,
  start_date: start_date,
  end_date: start_date + rand(1..7).days,
  status: status.sample,
)

violin2 = Instrument.create!(
  title: before_title.sample + " " +"Stradivarius Violin",
  category: "String",
  body: "A Stradivarius is one of the violins, violas, cellos, and other string instruments built by members of the Italian family Stradivari, particularly Antonio Stradivari (Latin: Antonius Stradivarius), during the 17th and 18th centuries. According to their reputation, the quality of their sound has defied attempts to explain or equal it, though this belief is disputed. The fame of Stradivarius instruments is widespread, appearing in numerous works of fiction.",
  price: rand(50..300),
  user: users.sample,
  location: locations.sample,
  start_date: start_date,
  end_date: start_date + rand(1..7).days,
  availability: availability.sample
)

violin2.photos.attach(io: URI.open("https://static.independent.co.uk/s3fs-public/thumbnails/image/2014/06/08/14/Violin.jpg?width=1200"), filename: "#{violin2.title}.jpg", content_type: 'image/jpg')
violin2.photos.attach(io: URI.open("https://media.npr.org/assets/img/2014/05/16/undefined-d5b7e5943dd2d811fd1bebc0c1ca17579a84ebe2.jpg"), filename: "#{violin2.title}.jpg", content_type: 'image/jpg')
violin2.photos.attach(io: URI.open("https://framemark.vam.ac.uk/collections/2010EK2538/full/735,/0/default.jpg"), filename: "#{violin2.title}.jpg", content_type: 'image/jpg')

Booking.create!(
  user: users.sample,
  instrument: violin2,
  start_date: start_date,
  end_date: start_date + rand(1..7).days,
  status: status.sample,
)

violin3 = Instrument.create!(
  title: before_title.sample + " " +"Classical Violin",
  category: "String",
  body: "The violin, sometimes known as a fiddle, is a wooden chordophone (string instrument) in the violin family. Most violins have a hollow wooden body. It is the smallest and thus highest-pitched instrument (soprano) in the family in regular use. The violin typically has four strings, usually tuned in perfect fifths with notes G3, D4, A4, E5, and is most commonly played by drawing a bow across its strings. It can also be played by plucking the strings with the fingers (pizzicato) and, in specialized cases, by striking the strings with the wooden side of the bow (col legno).",
  price: rand(50..300),
  user: users.sample,
  location: locations.sample,
  start_date: start_date,
  end_date: start_date + rand(1..7).days,
  availability: availability.sample
)

violin3.photos.attach(io: URI.open("https://npr.brightspotcdn.com/dims4/default/affed37/2147483647/strip/true/crop/1200x800+0+0/resize/880x587!/quality/90/?url=http%3A%2F%2Fnpr-brightspot.s3.amazonaws.com%2F3b%2Fa6%2Ffa9514244fe78b441079a4903eba%2Frbpviolin.jpeg"), filename: "#{violin3.title}.jpg", content_type: 'image/jpg')
violin3.photos.attach(io: URI.open("https://i.ytimg.com/vi/ml0WSnl7AAk/maxresdefault.jpg"), filename: "#{violin3.title}.jpg", content_type: 'image/jpg')
violin3.photos.attach(io: URI.open("https://static3.bigstockphoto.com/7/9/2/large1500/297629128.jpg"), filename: "#{violin3.title}.jpg", content_type: 'image/jpg')

Booking.create!(
  user: users.sample,
  instrument: violin3,
  start_date: start_date,
  end_date: start_date + rand(1..7).days,
  status: status.sample,
)

#Saxophone

saxophone1 = Instrument.create!(
  title: before_title.sample + " " +"Alto Saxophone",
  category: "Wind",
  body: "The alto saxophone, also referred to as the alto sax or simply the alto, is a member of the saxophone family of woodwind instruments invented by Belgian instrument designer Adolphe Sax in the 1840s, and patented in 1846. It is pitched in E♭, and is smaller than the tenor, but larger than the soprano. The alto sax is the most common saxophone and is commonly used in concert bands, chamber music, solo repertoire, military bands, marching bands, and jazz (such as big bands and jazz combos).",
  price: rand(50..300),
  user: users.sample,
  location: locations.sample,
  start_date: start_date,
  end_date: start_date + rand(1..7).days,
  availability: availability.sample
)

saxophone1.photos.attach(io: URI.open("https://drop.philharmoniedeparis.fr/Reperes/Jazz/Instruments/Sax-alto/Kenny-Garrett-%C2%A9-Maxime-Guthfreund.jpg"), filename: "#{saxophone1.title}.jpg", content_type: 'image/jpg')
saxophone1.photos.attach(io: URI.open("https://www.instruments-musique-celtique.fr/971-product_hd/saxophone-alto-mib-chevallier.jpg"), filename: "#{saxophone1.title}.jpg", content_type: 'image/jpg')
saxophone1.photos.attach(io: URI.open("https://img.kirstein.de/out/pictures/generated/product/6/2000_2000_75/821aa87ec78312bf3dc1d9c4c185d_6.jpg"), filename: "#{saxophone1.title}.jpg", content_type: 'image/jpg')

Booking.create!(
  user: users.sample,
  instrument: saxophone1,
  start_date: start_date,
  end_date: start_date + rand(1..7).days,
  status: status.sample,
)

saxophone2 = Instrument.create!(
  title: before_title.sample + " " +"Soprano Saxophone",
  category: "Wind",
  body: "The soprano saxophone is a higher-register variety of the saxophone, a woodwind instrument invented by Adolphe Sax. The soprano is the third smallest member of the saxophone family, which consists (from smallest to largest) of the soprillo, sopranino, soprano, alto, tenor, baritone, bass, contrabass saxophone and tubax. Soprano saxophones are the smallest saxophone in common use.",
  price: rand(50..300),
  user: users.sample,
  location: locations.sample,
  start_date: start_date,
  end_date: start_date + rand(1..7).days,
  availability: availability.sample
)

saxophone2.photos.attach(io: URI.open("https://d1aeri3ty3izns.cloudfront.net/media/51/515582/600/preview.jpg"), filename: "#{saxophone2.title}.jpg", content_type: 'image/jpg')
saxophone2.photos.attach(io: URI.open("https://m.media-amazon.com/images/I/61mKJVzciqL._AC_UF1000,1000_QL80_.jpg"), filename: "#{saxophone2.title}.jpg", content_type: 'image/jpg')
saxophone2.photos.attach(io: URI.open("https://www.atelier-des-vents.com/3855-large_default/saxophone-soprano-selmer-serie-iii.jpg"), filename: "#{saxophone2.title}.jpg", content_type: 'image/jpg')

Booking.create!(
  user: users.sample,
  instrument: saxophone2,
  start_date: start_date,
  end_date: start_date + rand(1..7).days,
  status: status.sample,
)

#Trumpet

trumpet1 = Instrument.create!(
  title: before_title.sample + " " +"Bach Trumpet",
  category: "Wind",
  body: "The trumpet is a brass instrument commonly used in classical and jazz ensembles. The trumpet group ranges from the piccolo trumpet with the highest register in the brass family, to the bass trumpet, which is pitched one octave below the standard B♭ or C Trumpet. Trumpet-like instruments have historically been used as signaling devices in battle or hunting, with examples dating back to at least 1500 BC; they began to be used as musical instruments only in the late 14th or early 15th century.",
  price: rand(50..300),
  user: users.sample,
  location: locations.sample,
  start_date: start_date,
  end_date: start_date + rand(1..7).days,
  availability: availability.sample
)

trumpet1.photos.attach(io: URI.open("https://i.ebayimg.com/images/g/nskAAOSwt3Jh~1ZA/s-l1600.jpg"), filename: "#{trumpet1.title}.jpg", content_type: 'image/jpg')
trumpet1.photos.attach(io: URI.open("https://kesslerandsons.com/wp-content/uploads/new-bach-strad-180s37-trumpet.jpg"), filename: "#{trumpet1.title}.jpg", content_type: 'image/jpg')
trumpet1.photos.attach(io: URI.open("https://rvb-img.reverb.com/image/upload/s--57EmEkDS--/a_exif,c_limit,e_unsharp_mask:80,f_auto,fl_progressive,g_south,h_1600,q_80,w_1600/v1488819808/fbccc5uaq3dibr7orhow.jpg"), filename: "#{trumpet1.title}.jpg", content_type: 'image/jpg')

Booking.create!(
  user: users.sample,
  instrument: trumpet1,
  start_date: start_date,
  end_date: start_date + rand(1..7).days,
  status: status.sample,
)


trumpet2 = Instrument.create!(
  title: before_title.sample + " " +"Cornet Trumpet",
  category: "Wind",
  body: "The cornet is a brass instrument similar to the trumpet but distinguished from it by its conical bore, more compact shape, and mellower tone quality. The most common cornet is a transposing instrument in B♭, though there is also a soprano cornet in E♭ and cornets in A and C. All are unrelated to the renaissance and early baroque cornett.",
  price: rand(50..300),
  user: users.sample,
  location: locations.sample,
  start_date: start_date,
  end_date: start_date + rand(1..7).days,
  availability: availability.sample
)

trumpet2.photos.attach(io: URI.open("https://upload.wikimedia.org/wikipedia/commons/3/32/Yamaha_Cornet_YCR-6330II_crop.png"), filename: "#{trumpet2.title}.jpg", content_type: 'image/jpg')
trumpet2.photos.attach(io: URI.open("https://rvb-img.reverb.com/image/upload/s--u8c1RYRx--/a_0/f_auto,t_large/v1694232599/i3afsx4ditzpqoaf1ijw.jpg"), filename: "#{trumpet2.title}.jpg", content_type: 'image/jpg')
trumpet2.photos.attach(io: URI.open("https://pvwb.net/images/produitsarticles/adams-cn1cornet-1586339255.jpg"), filename: "#{trumpet2.title}.jpg", content_type: 'image/jpg')

Booking.create!(
  user: users.sample,
  instrument: trumpet2,
  start_date: start_date,
  end_date: start_date + rand(1..7).days,
  status: status.sample,
)

  #Banjo

banjo1 = Instrument.create!(
  title: before_title.sample + " " +"5-String Banjo",
  category: "String",
  body: "The banjo is a stringed instrument with a thin membrane stretched over a frame or cavity to form a resonator. The membrane is typically circular, and usually made of plastic, or occasionally animal skin. Early forms of the instrument were fashioned by Africans in Colonial America, adapted from several African instruments of similar design.",
  price: rand(50..300),
  user: users.sample,
  location: locations.sample,
  start_date: start_date,
  end_date: start_date + rand(1..7).days,
  availability: availability.sample
)

banjo1.photos.attach(io: URI.open("https://i.ebayimg.com/images/g/gqcAAOSwB-1Y1A9U/s-l1200.webp"), filename: "#{banjo1.title}.jpg", content_type: 'image/jpg')
banjo1.photos.attach(io: URI.open("https://fr.euroguitar.com/images/products/gold-tone/cc-100r-cripple-creek-5-string-resonator-5c-med-189170.jpg"), filename: "#{banjo1.title}.jpg", content_type: 'image/jpg')
banjo1.photos.attach(io: URI.open("https://thumbs.static-thomann.de/thumb/padthumb600x600/pics/bdb/_43/436254/14290848_800.jpg"), filename: "#{banjo1.title}.jpg", content_type: 'image/jpg')

Booking.create!(
  user: users.sample,
  instrument: banjo1,
  start_date: start_date,
  end_date: start_date + rand(1..7).days,
  status: status.sample,
)

# 20.times do
#   instrument = Instrument.create!(
#     title: (before_title.sample.sample + " " + "#{Faker::Music.instrument}"),
#     body: Faker::Lorem.paragraph(sentence_count: 5),
#     category: categories.sample,
#     price: Faker::Commerce.price(range: 50..1000),
#     user: users.sample,
#     location: locations.sample,
#     start_date: start_date,
#     end_date: start_date + rand(1..7).days,
#     availability: availability.sample
#   )

#   instrument_name = instrument.title
#   url = "https://source.unsplash.com/300x300?#{instrument_name},instrument,#{instrument.category}"
#   puts instrument_name

#   photos_urls = [
#     url,
#     url,
#     url
#   ]
#   photos_urls.each do |url|
#     photos = URI.open(url)
#     instrument.photos.attach(io: photos, filename: "#{Instrument.last.title}.jpg", content_type: 'image/jpg')
#   end
#   # URI.open(Faker::LoremFlickr.image(size: "500x600", search_terms: ['instrument']))
#   # Instrument.last.photos.attach(io: photos, filename: "#{Instrument.last.title}.jpg", content_type: 'image/jpg')
#   instrument.save!
#   puts "Seeded #{Instrument.count} instruments with #{instrument.photos.count} photos."
# end
# puts "Created #{Instrument.count} instruments with #{Instrument.photos.count} photos."
# puts "Created #{Instrument.count} instruments."

# puts "Creating bookings..."
# # Create a booking
# instruments = Instrument.all
# statuses = ["Pending", "Confirmed", "Cancelled"]

# 4.times do
#   start_date = Faker::Date.forward(days: 30)
#   end_date = start_date + rand(1..7).days

#   Booking.create!(
#     user: users.sample,
#     instrument: instruments.sample,
#     start_date: start_date,
#     end_date: end_date,
#     status: statuses.sample,
#     total_price: rand(50..1000)
#   )
# end
# puts "Created #{Booking.count} bookings."
# puts "Seeded #{User.count} users, #{Instrument.count} instruments, and #{Booking.count} bookings."
puts "Done seeding the database."

# photo: Faker::Avatar.image(size: "50x50", format: "jpg")
# photo: Faker::LoremFlickr.image(size: "50x60", search_terms: ['instrument'])
