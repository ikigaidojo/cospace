class AddMemberAssociationToRoomBookings < ActiveRecord::Migration[5.1]
  def change
    add_reference :room_bookings, :member, foreign_key: true
  end
end
