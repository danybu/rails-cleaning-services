# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)




Cleaner.create!(name:"Karina",
  description:"Takes the job too serious, we think. Top notch.",
  price: rand(7..20), age: 30, photo_url:"poetsvrouw", address: "Domeinstraat 3, Leuven")
Cleaner.create!(name:"Samira",
  description:"She's got a sponge and not afraid to use it",
  price: rand(7..20), age: 33, photo_url:"kitchen", address:"Smallandlaan 3, Antwerpen")
Cleaner.create!(name:"Christina",
  description:"Basically just sits there for an hour or two.",
  price: rand(7..20), age: 23, photo_url:"belgique", address:"Pierre Van Humbeekstraat 33, 1080 Sint-Jans-Molenbeek")
Cleaner.create!(name:"Sad Sophie",
  description:"Not her first carreer choice",
  price: rand(7..20), age: 31, photo_url:"femme-de-menage-1", address:"gemeenteplein 26, 3010 Kessel-Lo")
Cleaner.create!(name:"Suzy",
  description:"Eats plants. Smiles a lot.",
  price: rand(7..20), age: 45, photo_url:"full_woman",address:"rue de gosselies 13, charleroi")
Cleaner.create!(name:"Hans the hero",
  description:"he's got the power. And man boobs.",
  price: rand(7..20), age: 29, photo_url:"funny_plumeau", address:"rue du progres 39, froyennes")
Cleaner.create!(name:"Gerald",
  description:"Particular. Old but bendy",
  price: rand(7..20), age: 49, photo_url:"menage2", address:"Kerkstraat 108, gentbrugge")
Cleaner.create!(name:"Olga",
  description:"She's got a lot of tools!",
  price: rand(7..20), age: 37, photo_url:"mopping", address:"Leuvensesteenweg 282, Boortmeerbeek")
Cleaner.create!(name:"Lil' Bert",
  description:"Barely walking, we put him to work.",
  price: rand(7..20), age: 2, photo_url:"baby", address:"avenue des combattants 18, genval")
Cleaner.create!(name:"Bollywood Boys",
  description:"minimum wage is ok for them as long as they can dance",
  price: rand(7..20), age: 29, photo_url:"pakistani", address:"meysbrug 4, mechelen")
Cleaner.create!(name:"Tom and Tina",
  description:"Professional, fast, but they argue",
  price: rand(7..20), age: 30, photo_url:"Poetshulp-met-dienstencheques", address:"rue de la borgogne 44")
Cleaner.create!(name:"Bertrand",
  description:"Can vacuum everywhere. Even in the mountains.",
  price: rand(7..20), age: 55, photo_url:"vacuum_man", address:"Joseph van instraat 2500 lier")
Cleaner.create!(name:"Theodore",
  description:"Scared of ladders",
  price: rand(7..20), age: 33, photo_url:"window", address:"streekbaan 193, vilvoorde")
puts "Done seeding cleaners"


while User.count < 20
  User.create! email: Faker::Internet.email, encrypted_password: 'password1234', address: Faker::Address.full_address, password: 'thisisapass1234'
end

guard = 1
while Reservation.count < 20
  my_res = Reservation.new
  my_res.user = User.find(guard)
  my_res.cleaner = Cleaner.find(rand(1..5))
  my_res.status = rand(1..3).to_s
  my_res.reserved_on = Time.now
  guard += 1
  my_res.save
end

i=1
while Review.count < 20
  rev = Review.new
  rev.rating = rand(1..5)
  rev.content = Faker::Movies::HarryPotter.quote
  rev.reservation = Reservation.find(i)
  i = i+1
  rev.save
end

# Review.create(rating:2, content:"man so bad", )
