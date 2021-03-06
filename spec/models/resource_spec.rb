require 'rails_helper'

RSpec.describe Resource, type: :model do
  
  before :each do
  	@name = "projector"
  	@price = 1500.00

  	@resource = Resource.create do |m|
  	  m.name = @name
  	  m.price = @price
	 end
  end

	it "should be able to create a name attribute" do
  	expect(@resource.name).to eq @name
  end

  it "should be able to create a price attribute" do
    expect(@resource.price).to eq @price
  end

  it "should 'has_many' resource_bookings" do
    should have_many(:resource_bookings)
  end

  it "should 'belongs_to' admin" do
    should belong_to(:admin)
  end

end
