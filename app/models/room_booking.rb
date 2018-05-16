class RoomBooking < ApplicationRecord

  belongs_to :room,   optional: true
  belongs_to :member, optional: true

end
