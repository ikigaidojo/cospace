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

booking1_room_booking = RoomBooking.create(name: "Booking1", description: Faker::Lorem.sentence, price: 95000, location: "Launch Garage", date_booked: DateTime.now )
booking2_room_booking = RoomBooking.create(name: "Booking2", description: Faker::Lorem.sentence, price: 85000, location: "Launch Garage", date_booked: DateTime.now )
booking3_room_booking = RoomBooking.create(name: "Booking3", description: Faker::Lorem.sentence, price: 75000, location: "Launch Garage", date_booked: DateTime.now )
booking4_room_booking = RoomBooking.create(name: "Booking4", description: Faker::Lorem.sentence, price: 65000, location: "Launch Garage", date_booked: DateTime.now )
booking5_room_booking = RoomBooking.create(name: "Booking5", description: Faker::Lorem.sentence, price: 55000, location: "Launch Garage", date_booked: DateTime.now )
booking6_room_booking = RoomBooking.create(name: "Booking6", description: Faker::Lorem.sentence, price: 45000, location: "Launch Garage", date_booked: DateTime.now )
booking7_room_booking = RoomBooking.create(name: "Booking7", description: Faker::Lorem.sentence, price: 35000, location: "Launch Garage", date_booked: DateTime.now )
booking8_room_booking = RoomBooking.create(name: "Booking8", description: Faker::Lorem.sentence, price: 25000, location: "Launch Garage", date_booked: DateTime.now )


[
  booking1_room_booking,
  booking2_room_booking,
].each do |room_booking|
  mandalore_room.room_bookings << room_booking  
end

[
  booking3_room_booking,
  booking4_room_booking,
].each do |room_booking|
  kashyyyk_room.room_bookings << room_booking  
end

[
  booking5_room_booking,
  booking6_room_booking,
].each do |room_booking|
  endor_room.room_bookings << room_booking  
end

[
  booking7_room_booking,
  booking8_room_booking,
].each do |room_booking|
  tatooine_room.room_bookings << room_booking  
end

mark_member = Member.create(first_name: "Mark", last_name: "Hermano", phone_number: "09358645310", gender: "Male", password: "123456", email: "hermano.mark@yahoo.com" )

[
  booking1_room_booking,
  booking2_room_booking,
  booking3_room_booking,
  booking4_room_booking,
  booking5_room_booking,
  booking6_room_booking,
  booking7_room_booking,
  booking8_room_booking,
].each do |room_booking|
  mark_member.room_bookings << room_booking  
end




