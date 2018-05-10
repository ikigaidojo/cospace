class AddRoomAssociationToRoomBookings < ActiveRecord::Migration[5.1]
  def change
    add_reference :room_bookings, :room, foreign_key: true
  end
end
