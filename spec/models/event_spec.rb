require 'rails_helper'

RSpec.describe Event, type: :model do
  before :each do
    @event = Event.create do |ev|
      ev.name = "Birthday" 
      ev.description = "meeting"
      ev.room = "Center Room"
      ev.price = 5000
      ev.attendees = 30
    end

  end 

  it "should be able to create a name" do
    expect(@event.name).to eq "Birthday" 
  end

  it "should be able to create a description" do
    expect(@event.description).to eq "meeting" 
  end

  it "should be able to create a room" do
    expect(@event.room).to eq "Center Room" 
  end

  it "should be able to create a price" do
    expect(@event.price).to eq 5000
  end

  it "should be able to create a attendees" do
    expect(@event.attendees).to eq 30
  end
end