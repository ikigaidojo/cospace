class Member < ApplicationRecord
  
  # Include default devise modules. Others available are:
  # :timeoutable and :omniauthable
  devise :database_authenticatable, 
         :registerable,
         :recoverable, 
         :rememberable, 
         :trackable, 
         :validatable, 
         :confirmable, 
         :lockable

  validates_presence_of :first_name,        :message => "Can't be blank"
  validates_presence_of :email,             :message => "Can't be blank"
  validates_format_of   :email,             with: /\A[\w]([^@\s,;]+)@(([\w-]+\.)+(com|edu|org|net|gov|mil|biz|info))\z/i, :message => "Must be a valid email"
  validates_presence_of :phone_number,      :message => "Can't be blank", :allow_nil => true
  validates_presence_of :gender,            :message => "Can't be blank", :allow_nil => true
  validates_presence_of :password,          :message => "Can't be blank"
  validates_presence_of :current_password,  if: :validate_password?, on: :update
  validate :current_password_is_correct,    if: :validate_password?, on: :update
  
  attr_accessor :password, :current_password
  
  def self.authenticate(member, password)  
     member = find_by_id(member)
     member && member.password_change == BCrypt::Engine.hash_secret(password, member.password_was)
  end

  def current_password_is_correct
    unless Member.authenticate(id, current_password)
     errors.add(:current_password, "Wrong password.")
    end
  end

  def validate_password?
    !password.blank?
  end
 
  
  has_many   :room_bookings
  has_many   :invoices
  has_many   :payment_confirmations 
  has_many   :resource_bookings
  has_many   :events
  has_many   :event_attendees
  belongs_to :admin, optional: true

end
