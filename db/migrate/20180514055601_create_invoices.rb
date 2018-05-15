class CreateInvoices < ActiveRecord::Migration[5.1]
  def change
    create_table  :invoices do |t|
      t.string    :invoice_name
      t.string    :description
      t.datetime  :date_paid
      t.integer   :price
      t.string    :status
      t.string    :location

      t.timestamp
    end
  end
end
