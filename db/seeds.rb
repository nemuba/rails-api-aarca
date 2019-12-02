# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
10.times do
  Race.create(local: Faker::Address.full_address, description: Faker::Lorem.paragraph, date_race: Faker::Date.in_date_period)
end

10.times do |f|
  if f % 2 == 0
    TypeTest.create(genre: "Masculino", oar: Faker::Number.between(from: 1, to: 5));
  else
    TypeTest.create(genre: "Feminino", oar: Faker::Number.between(from: 1, to: 5));
  end
end