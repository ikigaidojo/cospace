class Room < ApplicationRecord
  validates :name, :presence => true
  has_many  :room_bookings
end
