class AddAdminAssociationToMembers < ActiveRecord::Migration[5.1]
  def change
    add_reference :members, :admin, foreign_key: true
  end
end
