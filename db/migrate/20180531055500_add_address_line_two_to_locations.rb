class AddAddressLineTwoToLocations < ActiveRecord::Migration[5.1]
  def change
    add_column :locations, :address_line_two, :string
    add_column :locations, :city_state, :string
  end
end
