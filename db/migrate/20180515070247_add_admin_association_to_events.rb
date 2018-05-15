class AddAdminAssociationToEvents < ActiveRecord::Migration[5.1]
  def change
    add_reference :events, :admin, foreign_key: true
  end
end
