require 'rails_helper'

RSpec.describe MembershipType, type: :model do

  before :each do
    @membershiptype = MembershipType.create do |mt|
      mt.name = "Membership name" 
      mt.price = 200
      mt.total_price = 200
      mt.status = true

    end

  end 

  it "should be able to create a name" do
    expect(@membershiptype.name).to eq "Membership name" 
  end

  it "should be able to create a price" do
    expect(@membershiptype.price).to eq 200
  end

  it "should be able to create a total_price" do
    expect(@membershiptype.total_price).to eq 200
  end

  it "should be able to create a status" do
    expect(@membershiptype.status).to eq true
  end

end