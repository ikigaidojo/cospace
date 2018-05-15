class Event < ApplicationRecord

  has_many :event_attendees
  belongs_to :member
  belongs_to :admin
  
end
