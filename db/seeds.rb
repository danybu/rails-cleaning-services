# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

  while Cleaners.count < 40
    Cleaners.create! name:Faker::Name.female_first_name, description:Faker::Quote.famous_last_words, price: rand(7..20), age: rand(18..70), average_rating: rand(0..5)
  end

  while Users.count < 10
    Users.create! email: Faker::Internet.email, encrypted_password: 'password1234', address: Faker::Address.full_address
  end

  while Reviews.count < 15
    Reviews.create! rating:rand(1..5), content:Faker::Movies::HarryPotter.quote
  end

  i = 1
  while Reservations.count < 9
    my_res = Reservations.new
    my_res.users = Users.find(i)
    my_res.cleaners = Cleaners.find(i)
    i += 1
  end
