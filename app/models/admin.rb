class Admin < ApplicationRecord

  has_many :resources
  has_many :units
	has_many :events
  has_many :rooms
	has_many :invoices
	has_many :membership_types
  has_many :members

end
