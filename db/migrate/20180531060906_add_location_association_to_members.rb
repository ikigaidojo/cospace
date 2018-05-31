class AddLocationAssociationToMembers < ActiveRecord::Migration[5.1]
  def change
    add_reference :members, :location, foreign_key: true
  end
end
