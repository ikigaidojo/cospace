class ResourceBooking < ApplicationRecord
  
  belongs_to :resource, optional: true

end
