class AddPostCodeToLocations < ActiveRecord::Migration[5.1]
  def change
    add_column :locations, :post_code, :string
  end
end
