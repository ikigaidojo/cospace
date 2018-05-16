class Membership < ApplicationRecord
  belongs_to :membership_type, optional: true
end
