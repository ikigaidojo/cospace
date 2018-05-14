class CreateResourceBookings < ActiveRecord::Migration[5.1]
  def change
    create_table   :resource_bookings do |t|
      t.string     :name
      t.integer    :price
      t.datetime   :date_booked
      t.references :member
      t.references :resource

      t.timestamp
    end
  end
end
