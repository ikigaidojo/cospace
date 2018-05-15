class Invoice < ApplicationRecord
  validates_presence_of :invoice_name, :message => "Can't be blank"
  validates_presence_of :location,     :message => "Can't be blank"
  validates_presence_of :description,  :message => "Can't be blank"
  validates_presence_of :date_paid,    :message => "Can't be blank"
  validates_presence_of :status,       :message => "Can't be blank"
  validates_presence_of :price,        :message => "Can't be blank"
  validates             :price, numericality: { only_integer: true, greater_than_or_equal_to: 0 }

  belongs_to :member, optional: true
  
end

