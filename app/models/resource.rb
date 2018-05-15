class Resource < ApplicationRecord
	validates   :name, :presence => true
  has_many    :resource_bookings
  belongs_to  :admin
end
