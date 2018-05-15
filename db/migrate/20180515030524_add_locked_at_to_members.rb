class AddLockedAtToMembers < ActiveRecord::Migration[5.1]
  def change
    add_column :members, :locked_at, :datetime
  end
end
