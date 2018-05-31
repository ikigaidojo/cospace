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
 

mandalore_room = Room.create(name: "Mandalore", description: "Cozy room located at the back of launchgarage, othersie known as the engine room", location: "Launch Garage", price: 95000, facilities: "a tv, a airconditioner, some water from the water container, power, tables, refridgerator, white-board and markers.")
 kashyyyk_room = Room.create(name: "Kashyyyk",  description: Faker::Lorem.sentence, location: "Launch Garage", price: 85000, facilities: Faker::Lorem.sentence)
    endor_room = Room.create(name: "Endor",     description: Faker::Lorem.sentence, location: "Launch Garage", price: 75000, facilities: Faker::Lorem.sentence)
 tatooine_room = Room.create(name: "Tatooine",  description: Faker::Lorem.sentence, location: "Launch Garage", price: 65000, facilities: Faker::Lorem.sentence)
     hoth_room = Room.create(name: "Hoth",      description: Faker::Lorem.sentence, location: "Launch Garage", price: 55000, facilities: Faker::Lorem.sentence)

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

# create location
Location.create(
  name: "Launch Garage", 
  address: "Level 2, Industria Mall, Circulo Verde,", 
  address_line_two: "Calle Industria, Bagumbayan, Quezon City,", 
  city_state: "Metro Manila", 
  post_code: "1110",
  email: "launchgarage@gmail.com", 
  phone_number: "022816970", 
  map: "https://goo.gl/maps/qg2brUptdNE2")


# Mandalore Room and Kashyyyk Room booked by Mara on 2018/06/25
room_booking = RoomBooking.create(date_booked: DateTime.parse("2018-06-25"))
mandalore_room.room_bookings << room_booking
mara_member.room_bookings << room_booking

room_booking = RoomBooking.create(date_booked: DateTime.parse("2018-06-25"))
kashyyyk_room.room_bookings << room_booking
mara_member.room_bookings << room_booking



#Two rooms booked by Tim 
room_booking = RoomBooking.create(name: "Booking1", member_id: 3, facilities: "some pencils, paper, power in tables, water, air-conditioning, coffee", description: "a pretty nice room nestled in the back of launch garage", price: 9430, location: "Launch Garage", date_booked: DateTime.parse("2018-10-05")  )
endor_room.room_bookings << room_booking
tim_member.room_bookings << room_booking

room_booking = RoomBooking.create(name: "Booking1", member_id: 3, facilities: " a bathtub, a chef who can only cook salmon, three baby goats, some rubber duckys for the bath", description: "a quirky room, not the kind you would usually work in, but charming.", price: 9430, location: "Launch Garage", date_booked: DateTime.parse("2018-10-05") )
hoth_room.room_bookings << room_booking
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

