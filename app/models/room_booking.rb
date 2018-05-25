class RoomBooking < ApplicationRecord

  belongs_to :room,   optional: true
  belongs_to :member, optional: true
# remember to add a migration that creats a dateTime called "date_booking_created" and set it to time.now
end
