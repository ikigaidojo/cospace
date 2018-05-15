class AddAdminAssociationToRooms < ActiveRecord::Migration[5.1]
  def change
    add_reference :rooms, :admin, foreign_key: true
  end
end
