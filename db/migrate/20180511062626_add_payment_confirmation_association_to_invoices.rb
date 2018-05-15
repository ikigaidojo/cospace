class AddPaymentConfirmationAssociationToInvoices < ActiveRecord::Migration[5.1]
  def change
    add_reference :invoices, :payment_confirmation, foreign_key: true
  end
end
