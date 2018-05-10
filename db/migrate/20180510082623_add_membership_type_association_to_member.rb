class AddMembershipTypeAssociationToMember < ActiveRecord::Migration[5.1]
  def change
    add_reference :members, :membership_type, foreign_key: true
  end
end
