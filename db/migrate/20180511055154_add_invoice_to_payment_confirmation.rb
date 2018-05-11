class AddInvoiceToPaymentConfirmation < ActiveRecord::Migration[5.1]
  def change
    add_reference :payment_confirmations, :invoice, foreign_key: true
  end
end
