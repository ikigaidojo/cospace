class CreatePaymentConfirmations < ActiveRecord::Migration[5.1]
  def change
    create_table :payment_confirmations do |t|
      t.string     :name
      t.text       :description
      t.integer    :price
      t.datetime   :date_issued
      t.references :member
      t.references :invoice

      t.timestamp
    end
  end
end
