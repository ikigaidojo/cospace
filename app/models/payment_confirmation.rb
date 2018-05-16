  class PaymentConfirmation < ApplicationRecord
  belongs_to :member,  optional: true
  belongs_to :invoice, optional: true
end 
