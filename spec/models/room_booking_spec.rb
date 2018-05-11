require 'rails_helper'

RSpec.describe RoomBooking, type: :model do  

  before :each do
    @roombooking = RoomBooking.create do |rb|
      rb.name = "ikigaidojo" 
      rb.description = "wide"
      rb.price = 380
      rb.facilities = "bed"
      rb.location = "launch garage"
      rb.date_booked = "January"
    end

  end 

  it "should be able to create a name" do
    expect(@roombooking.name).to eq "ikigaidojo" 
  end

  it "should be able to create a description" do
    expect(@roombooking.description).to eq "wide" 
  end

  it "should be able to create a price" do
    expect(@roombooking.price).to eq 380
  end

  it "should be able to create a facilities" do
    expect(@roombooking.facilities).to eq "bed" 
  end

  it "should be able to create a location" do
    expect(@roombooking.location).to eq "launch garage" 
  end

  it "should be able to create a date_booked" do
    expect(@roombooking.date_booked).to eq "January" 
  end

  it "should make sure room_bookings 'belong_to' member" do
    should belong_to(:member)
  end
 
 it "should 'belongs_to' room" do
    should belong_to(:room)
  end
end