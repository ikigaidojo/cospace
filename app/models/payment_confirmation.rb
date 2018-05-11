  class PaymentConfirmation < ApplicationRecord
  belongs_to :member
  belongs_to :invoice
end 
