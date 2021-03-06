require 'rails_helper'

RSpec.describe Member, type: :model do
        
  before :each do
    @first      = "Steve"
    @last       = "Jobs"
    @phone      = "0123456789"
    @email      = "steve.jobs@apple.com"
    @password   = "password"
    @time_created  = Time.zone.now
    @gender   = "male"
   
    @member = Member.create do |m|
      m.first_name   = @first
      m.last_name    = @last
      m.phone_number = @phone
      m.email        = @email
      m.password     = @password
      m.password_confirmation = @password
      m.gender       = @gender
      m.confirmed_at = @Time
    end
  end
    
  it "should have a first_name attribute" do
    expect(@member.first_name).to eq @first
  end

  it "should have a last_name attribute" do
    expect(@member.last_name).to eq @last
  end

  it "should have a phone_number attribute" do
    expect(@member.phone_number).to eq @phone
  end

  it "should have an email attribute" do
    expect(@member.email).to eq @email
  end

  it "should have a valid email" do
    @member.email = "/noDot@gmail.com"
    expect(@member.save).to eq false

    # If this test PASSES, then the email would not be accepted
  end

  it "should have a password attribute" do
    expect(@member.password).to eq @password
  end

  it "should have a gender attribute" do
    expect(@member.gender).to eq @gender
  end

  it "needs a first_name when filling out form" do  
    @member.first_name      = nil # if nil is changed to a first name, this should fail
    @member.last_name       = "Jobs"    
    @member.email           = "steve.jobs@apple.com"
    @member.save

    expect(@member.valid?).to eq false
  end

  it "needs an email when filling out form" do  
    @member.last_name       = "name"
    @member.first_name      = "mate"    
    @member.email           = nil   # if nil is changed to a valid email, this should fail
    @member.save

    expect(@member.valid?).to eq false
  end

  it "needs a valid email when filling out form" do  
    @member.email           = "steve.jobs/apple.com"   # if email is changed to a real email, this should fail, making the whole test fail
    @member.save        

    expect(@member.valid?).to eq false
  end

  it 'has a unique email' do
    #just to make test make more sense
    @member.email               = @email 
 
    @new = Member.new 
    @new.email                  = @email
    @new.first_name             = "Bob"
    @new.last_name              = "Bobson"
    @new.phone_number           = "0123456789"
    @new.password               = "password"
    @new.gender                 = "male"  
    

    expect(@new.valid?).to eq false
    expect(@new.save).to eq false
  end

  it "should make sure member 'has_many' room_booking" do
    should have_many(:room_bookings)
  end
  
  it "should have many payment confirmations" do
    should have_many(:payment_confirmations)
  end

  it "should have many invoices" do
    should have_many(:invoices)
  end
  
  it "should have many resource boookings" do
    should have_many(:resource_bookings)
  end

  it "should make sure member 'has_many' event" do
    should have_many(:events)
  end

  it "should make sure member 'has_many' event_attendee" do
    should have_many(:event_attendees)
  end

  it "should 'belongs_to admin' " do
    should belong_to(:admin)
  end
end # end .describe