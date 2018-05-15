class AddAdminAssociationToUnits < ActiveRecord::Migration[5.1]
  def change
    add_reference :units, :admin, foreign_key: true
  end
end
