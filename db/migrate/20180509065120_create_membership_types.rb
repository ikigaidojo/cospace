class CreateMembershipTypes < ActiveRecord::Migration[5.1]
  def change
    create_table :membership_types do |t|
      # t.string :name
      # t.integer :price
      # t.integer :total_price
      # t.boolean :status
      t.timestamps
    end
  end
end
