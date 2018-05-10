class AddMemberAssociationToPaymentConfirmations < ActiveRecord::Migration[5.1]
  def change
    add_reference :payment_confirmations, :member, foreign_key: true
  end
end
