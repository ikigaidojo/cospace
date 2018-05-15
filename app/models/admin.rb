class Admin < ApplicationRecord

	has_many :events
	has_many :invoices
	has_many :membership_types
end
