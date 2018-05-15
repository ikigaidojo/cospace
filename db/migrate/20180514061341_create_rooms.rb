class CreateRooms < ActiveRecord::Migration[5.1]
  def change
    create_table :rooms do |t|
      t.string   :name
      t.text     :description
      t.integer  :price
      t.string   :facilities
      t.string   :location

      t.timestamp
    end
  end
end
