class RemoveEmailFromMembers < ActiveRecord::Migration[5.1]
  def change
    remove_column :members, :email, :string
  end
end
