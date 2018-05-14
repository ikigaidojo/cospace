class CreateUnits < ActiveRecord::Migration[5.1]
  def change
    create_table :units do |t|
      t.string   :label
      t.text     :description
      
      t.timestamp
    end
  end
end
