class CreateResourceBookings < ActiveRecord::Migration[5.1]
  def change
    create_table :resource_bookings do |t|

      t.timestamps
    end
  end
end
