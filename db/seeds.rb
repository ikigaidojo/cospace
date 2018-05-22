# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

wade_admin   = Admin.create(first_name: "Wade", last_name: "Jacobson", email: "wade.jacobson@example.com")

 mara_member = Member.create(first_name: "Mara",  last_name: "Ross",      phone_number: "307-741-9142", gender: "female", password: "mara.ross@gmail.com",        email: "clara.ross@gmail.com",       confirmed_at: DateTime.now)
  tim_member = Member.create(first_name: "Tim",   last_name: "Smith",     phone_number: "718-879-5628", gender: "male. ", password: "tim.smith@gmail.com",        email: "tim.smith@gmail.com",        confirmed_at: DateTime.now)
wendy_member = Member.create(first_name: "Wendy", last_name: "Stanfield", phone_number: "256-228-4209", gender: "female", password: "wendy.stanfield@icloud.com", email: "wendy.stanfield@icloud.com", confirmed_at: DateTime.now)
 tina_member = Member.create(first_name: "Tina",  last_name: "Matlock",   phone_number: "901-328-3674", gender: "female", password: "tina.matlock@yahoo.com",     email: "tina.matlock@yahoo.com",     confirmed_at: DateTime.now)
frida_member = Member.create(first_name: "Frida", last_name: "Roux",      phone_number: "541-345-5308", gender: "female", password: "frida.roux@yahoo.com",       email: "frida.roux@yahoo.com",       confirmed_at: DateTime.now)
 

mandalore_room = Room.create(name: "Mandalore", description: Faker::Lorem.sentence, location: "Launch Garage", price: 95000)
 kashyyyk_room = Room.create(name: "Kashyyyk",  description: Faker::Lorem.sentence, location: "Launch Garage", price: 85000)
    endor_room = Room.create(name: "Endor",     description: Faker::Lorem.sentence, location: "Launch Garage", price: 75000)
 tatooine_room = Room.create(name: "Tatooine",  description: Faker::Lorem.sentence, location: "Launch Garage", price: 65000)
     hoth_room = Room.create(name: "Hoth",      description: Faker::Lorem.sentence, location: "Launch Garage", price: 55000)

     [
  mandalore_room,
   kashyyyk_room,
      endor_room,
   tatooine_room,
       hoth_room,
].each do |room|
  wade_admin.rooms << room  
end

room_booking_1 = RoomBooking.create(name: "Booking1", description: Faker::Lorem.sentence, price: 95000, location: "Launch Garage", date_booked: DateTime.now )
room_booking_2 = RoomBooking.create(name: "Booking2", description: Faker::Lorem.sentence, price: 85000, location: "Launch Garage", date_booked: DateTime.now )
room_booking_3 = RoomBooking.create(name: "Booking3", description: Faker::Lorem.sentence, price: 75000, location: "Launch Garage", date_booked: DateTime.now )
room_booking_4 = RoomBooking.create(name: "Booking4", description: Faker::Lorem.sentence, price: 65000, location: "Launch Garage", date_booked: DateTime.now )
room_booking_5 = RoomBooking.create(name: "Booking5", description: Faker::Lorem.sentence, price: 55000, location: "Launch Garage", date_booked: DateTime.now )
room_booking_6 = RoomBooking.create(name: "Booking6", description: Faker::Lorem.sentence, price: 45000, location: "Launch Garage", date_booked: DateTime.now )
room_booking_7 = RoomBooking.create(name: "Booking7", description: Faker::Lorem.sentence, price: 35000, location: "Launch Garage", date_booked: DateTime.now )
room_booking_8 = RoomBooking.create(name: "Booking8", description: Faker::Lorem.sentence, price: 25000, location: "Launch Garage", date_booked: DateTime.now )


# Mandalore Room and Kashyyyk Room booked by Mara on 06/25/2018
room_booking = RoomBooking.create(date_booked: DateTime.parse("2018-06-25"))
mandalore_room.room_bookings << room_booking
mara_member.room_bookings << room_booking

room_booking = RoomBooking.create(date_booked: DateTime.parse("2018-06-25"))
kashyyyk_room.room_bookings << room_booking
mara_member.room_bookings << room_booking



# Endor Room, Hoth Room and Tatooine Room booked by Tim on 06/26/2018
room_booking = RoomBooking.create(date_booked: DateTime.parse("2018-06-26"))
endor_room.room_bookings << room_booking
tim_member.room_bookings << room_booking

room_booking = RoomBooking.create(date_booked: DateTime.parse("2018-06-26"))
hoth_room.room_bookings << room_booking
tim_member.room_bookings << room_booking

room_booking = RoomBooking.create(date_booked: DateTime.parse("2018-06-26"))
tatooine_room.room_bookings << room_booking
tim_member.room_bookings << room_booking



# Kashyyyk Room booked by Wendy on 06/27/2018
room_booking = RoomBooking.create(date_booked: DateTime.parse("2018-06-27"))
kashyyyk_room.room_bookings << room_booking
wendy_member.room_bookings << room_booking



# Hoth Room and Tatooine Room booked by Mara on 06/28/2018
room_booking = RoomBooking.create(date_booked: DateTime.parse("2018-06-28"))
hoth_room.room_bookings << room_booking
tina_member.room_bookings << room_booking

room_booking = RoomBooking.create(date_booked: DateTime.parse("2018-06-28"))
tatooine_room.room_bookings << room_booking
tina_member.room_bookings << room_booking



# Mandalore Room, Kashyyyk Room, Endor Room and Tatooine Room booked by Mara on 06/25/2018
room_booking = RoomBooking.create(date_booked: DateTime.parse("2018-06-29"))
mandalore_room.room_bookings << room_booking
frida_member.room_bookings << room_booking

room_booking = RoomBooking.create(date_booked: DateTime.parse("2018-06-29"))
kashyyyk_room.room_bookings << room_booking
frida_member.room_bookings << room_booking

room_booking = RoomBooking.create(date_booked: DateTime.parse("2018-06-29"))
endor_room.room_bookings << room_booking
frida_member.room_bookings << room_booking

room_booking = RoomBooking.create(date_booked: DateTime.parse("2018-06-29"))
tatooine_room.room_bookings << room_booking
frida_member.room_bookings << room_booking

