class MembershipType < ApplicationRecord
  has_many :memberships
  has_many :members
  belongs_to :admin, optional: true
end
