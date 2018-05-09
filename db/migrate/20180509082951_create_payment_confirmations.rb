class CreatePaymentConfirmations < ActiveRecord::Migration[5.1]
  def change
    create_table :payment_confirmations do |t|
      t.string   :name
      t.text     :description
      t.integer  :price
      t.datetime :date_issued
      t.timestamps
    end
  end
end
