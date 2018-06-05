class AddDeactivatedToMembers < ActiveRecord::Migration[5.1]
  def change
    add_column :members, :deactivated, :bool
  end
end
