# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

cities = City.create([
  { name: 'Barcelona' }, 
  { name: 'Madrid' },
  { name: 'Bilbao' },
  { name: 'Sevilla' },
  { name: 'Pamplona' },
  { name: 'Valencia' },
  { name: 'Burgos' },
  { name: 'Orense' }
  ])

(1..50).each do 
  p = Concert.create(
    band: Faker::Company.name, 
    description: Faker::Lorem.sentence,
    venue: Faker::Address.street_address,
    city: cities[rand(cities.count)].name,
    date: Date.today + rand(60),
    price: rand(40) + ((rand(100).to_f / 100))
    )
  i = rand(2)
  (1..i).each do
    p.comments.create(
      author: Faker::Name.name,
      when:  DateTime.now + rand(24 * 3600 * 60),
      comment: Faker::Lorem.paragraph
      )
  end

  # ensure there is at least a concert for today
  if Concert.where("date = ?",Date.today).count == 0
    first = Concert.first
    first.date = Date.today
    first.save
  end

end
