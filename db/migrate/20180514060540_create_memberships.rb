class CreateMemberships < ActiveRecord::Migration[5.1]
  def change
    create_table :memberships do |t|
      t.string     :name
      t.integer    :price
      t.integer    :total_days
      t.integer    :remaining_days
      t.integer    :total_price
      t.datetime   :date_issued
      t.datetime   :date_ending
      t.boolean    :validity
      t.boolean    :current
      t.references :membership_type

      t.timestamp
    end
  end
end
