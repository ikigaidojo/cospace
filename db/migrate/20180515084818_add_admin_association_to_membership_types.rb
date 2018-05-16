class AddAdminAssociationToMembershipTypes < ActiveRecord::Migration[5.1]
  def change
    add_reference :membership_types, :admin, foreign_key: true
  end
end
