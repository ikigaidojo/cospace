class AddMemberAssociationToEvents < ActiveRecord::Migration[5.1]
  def change
    add_reference :events, :member, foreign_key: true
  end
end
