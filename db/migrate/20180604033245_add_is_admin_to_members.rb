class AddIsAdminToMembers < ActiveRecord::Migration[5.1]
  def change
    add_column :members, :is_admin, :bool
  end
end
