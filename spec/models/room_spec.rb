require 'rails_helper'

RSpec.describe Room, type: :model do  

  before :each do
    @room = Room.create do |r|
      r.name = "ikigaidojo" 
      r.description = "wide"
      r.price = 380
      r.facilities = "bed"
      r.location = "launch garage"
    end

  end 

  it "should be able to create a name" do
    expect(@room.name).to eq "ikigaidojo" 
  end

  it "should be able to create a description" do
    expect(@room.description).to eq "wide" 
  end

  it "should be able to create a price" do
    expect(@room.price).to eq 380
  end

  it "should be able to create a facilities" do
    expect(@room.facilities).to eq "bed" 
  end

  it "should be able to create a location" do
    expect(@room.location).to eq "launch garage" 
  end

  it "should make sure room 'has_many' room_booking" do
    should have_many(:room_bookings)
  end
  
end