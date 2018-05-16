class AddAdminAssociationToInvoices < ActiveRecord::Migration[5.1]
  def change
    add_reference :invoices, :admin, foreign_key: true
  end
end
