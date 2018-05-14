class CreateRoomBookings < ActiveRecord::Migration[5.1]
  def change
    create_table :room_bookings do |t|
      t.string     :name
      t.text       :description
      t.integer    :price
      t.string     :facilities
      t.string     :location
      t.datetime   :date_booked
      t.references :room
      t.references :member

      t.timestamp
    end
  end
end
