class AddMemberAssociationToInvoices < ActiveRecord::Migration[5.1]
  def change
    add_reference :invoices, :member, foreign_key: true
  end
end
