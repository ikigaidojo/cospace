class AddAdminAssociationToResources < ActiveRecord::Migration[5.1]
  def change
    add_reference :resources, :admin, foreign_key: true
  end
end
