class Member < ApplicationRecord

  validates_presence_of       :first_name,      :message => "Can't be blank"
  validates_presence_of       :last_name,       :message => "Can't be blank"

  validates_presence_of       :email,           :message => "Can't be blank" 
  validates_format_of :email, :uniqueness => true, :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i
  

  validates_presence_of       :phone_number,    :message => "Can't be blank"
  validates_presence_of       :gender,          :message => "Can't be blank"
  validates_presence_of       :password,        :message => "Can't be blank"
end
