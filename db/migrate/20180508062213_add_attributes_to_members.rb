class AddAttributesToMembers < ActiveRecord::Migration[5.1]
  def change
    add_column :members, :phone_number, :string
    add_column :members, :email, :string
    add_column :members, :password, :string
    add_column :members, :time_created, :datetime
    add_column :members, :gender, :string
  end
end
