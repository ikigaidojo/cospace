class Admin < ApplicationRecord

	has_many :events
  has_many :rooms
end
