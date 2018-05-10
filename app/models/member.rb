class Member < ApplicationRecord

  validates_presence_of       :first_name,      :message => "Can't be blank"
  validates_presence_of       :last_name,       :message => "Can't be blank"
  validates_presence_of       :email,           :message => "Can't be blank"
  validates :email, uniqueness: true
  validates_format_of :email, with: /\A[\w]([^@\s,;]+)@(([\w-]+\.)+(com|edu|org|net|gov|mil|biz|info))\z/i, :message => "Must be a valid email"
  validates_presence_of       :phone_number,    :message => "Can't be blank"
  validates_presence_of       :gender,          :message => "Can't be blank"
  validates_presence_of       :password,        :message => "Can't be blank"
  has_many :room_bookings

end
