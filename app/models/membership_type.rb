class MembershipType < ApplicationRecord
  has_many :memberships
  has_many :members
end
