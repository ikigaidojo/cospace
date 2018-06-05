class AddDeletedAtColumnToMembers < ActiveRecord::Migration[5.1]
  def change
    add_column :members, :deleted_at, :datetime
  end
end
