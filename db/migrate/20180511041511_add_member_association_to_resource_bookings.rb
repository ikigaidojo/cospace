class AddMemberAssociationToResourceBookings < ActiveRecord::Migration[5.1]
  def change
    add_reference :resource_bookings, :member, foreign_key: true
  end
end
