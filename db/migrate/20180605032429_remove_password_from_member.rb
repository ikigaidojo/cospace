class RemovePasswordFromMember < ActiveRecord::Migration[5.1]
  def change
    remove_column :members, :password, :string
  end
end
