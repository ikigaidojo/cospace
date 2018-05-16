class Room < ApplicationRecord
  validates  :name, :presence => true
  has_many   :room_bookings
  belongs_to :admin
end
