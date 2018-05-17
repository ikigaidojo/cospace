# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

wade_admin = Admin.create(first_name: "Wade", last_name: "Jacobson", email: "wade.jacobson@example.com")

mandalore_room = Room.create(name: "Mandalore", description: Faker::Lorem.sentence, location: "Launch Garage", price: 95000)
kashyyyk_room  = Room.create(name: "Kashyyyk",  description: Faker::Lorem.sentence, location: "Launch Garage", price: 85000)
endor_room     = Room.create(name: "Endor",     description: Faker::Lorem.sentence, location: "Launch Garage", price: 75000)
tatooine_room  = Room.create(name: "Tatooine",  description: Faker::Lorem.sentence, location: "Launch Garage", price: 65000)

[
  mandalore_room,
  kashyyyk_room,
  endor_room,
  tatooine_room,
].each do |room|
  wade_admin.rooms << room  
end
