class CreateEvents < ActiveRecord::Migration[5.1]
  def change
    create_table :events do |t|
    t.string  :name
    t.text    :description
    t.string  :room
    t.integer :price
    t.integer :attendees
      t.timestamps
    end
  end
end
