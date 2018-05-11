class AddResourceAssociationToResourceBookings < ActiveRecord::Migration[5.1]
  def change
    add_reference :resource_bookings, :resource, foreign_key: true
  end
end
