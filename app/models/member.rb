class Member < ApplicationRecord
  # Include default devise modules. Others available are:
  # :lockable,  and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable, :timeoutable
  # I made devise work by deleting the email column in the members table (in schema.rb). (using guide below)
  # https://stackoverflow.com/questions/38820188/rails-5-how-to-remove-a-column-from-a-database/38820224


  validates_presence_of       :first_name,      :message => "Can't be blank"
  validates_presence_of       :last_name,       :message => "Can't be blank"
  validates_presence_of       :email,           :message => "Can't be blank"
  validates :email, uniqueness: true
  validates_format_of :email, with: /\A[\w]([^@\s,;]+)@(([\w-]+\.)+(com|edu|org|net|gov|mil|biz|info))\z/i, :message => "Must be a valid email"
  validates_presence_of       :phone_number,    :message => "Can't be blank"
  validates_presence_of       :gender,          :message => "Can't be blank"
  validates_presence_of       :password,        :message => "Can't be blank"
end
