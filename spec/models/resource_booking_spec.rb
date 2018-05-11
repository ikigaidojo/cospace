require 'rails_helper'

RSpec.describe ResourceBooking, type: :model do
  
  before :each do
    @name   = "projector"
    @price  = 1500.00
    @date   = "January 15"

    @resourcebooking = ResourceBooking.create do |rsb|
      rsb.name  = @name
      rsb.price = @price
      rsb.date_booked = @date
    end
  end

  it "should be able to create a name attribute" do
      expect(@resourcebooking.name).to eq @name
  end


 it "should be able to create a price attribute" do
    expect(@resourcebooking.price).to eq @price
 end

it "should be able to create a date_booked" do
    expect(@resourcebooking.date_booked).to eq "January 15" 
  end

it "should 'belongs_to' resource" do
    should belong_to(:resource)
  end
end