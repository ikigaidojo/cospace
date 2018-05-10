class AddMembershipTypeAssociationToMembership < ActiveRecord::Migration[5.1]
  def change
    add_reference :memberships, :membership_type, foreign_key: true
  end
end
