class Event < ApplicationRecord

  has_many :event_attendees
  belongs_to :member, optional: true
  belongs_to :admin, optional: true
  
end
