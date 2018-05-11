class Event < ApplicationRecord

  has_many :event_attendees
  belongs_to :member
  
end
