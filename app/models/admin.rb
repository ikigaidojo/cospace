class Admin < ApplicationRecord

  has_many :units
	has_many :events

end
