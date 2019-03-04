# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

while Cleaner.count < 40
  Cleaner.create! name:Faker::Name.female_first_name, description:Faker::Quote.famous_last_words, price: rand(7..20), age: rand(18..70), average_rating: rand(0..5)
end

while User.count < 20
  User.create! email: Faker::Internet.email, encrypted_password: 'password1234', address: Faker::Address.full_address, password: 'thisisapass1234'
end

guard = 1
while Reservation.count < 9
  my_res = Reservation.new
  my_res.user = User.find(guard)
  my_res.cleaner = Cleaner.find(guard)
  guard += 1
  my_res.save
end

while Review.count < 15
  rev = Review.new
  rev.rating = rand(1..5)
  rev.content = Faker::Movies::HarryPotter.quote
  rev.reservation = Reservation.find(rand(1..9))
  rev.save
end
