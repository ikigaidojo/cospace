class RemoveEmailConfirmColumnFromMembers < ActiveRecord::Migration[5.1]
  def change
    remove_column :members, :email_confirmed, :boolean
    remove_column :members, :confirm_token, :string
  end
end
