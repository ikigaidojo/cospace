class AddAttributesToResourceBookings < ActiveRecord::Migration[5.1]
  def change
    add_column :resource_bookings, :name, :string
    add_column :resource_bookings, :price, :integer
    add_column :resource_bookings, :date_booked, :datetime
  end
end
