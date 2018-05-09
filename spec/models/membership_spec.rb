require 'rails_helper'

RSpec.describe Membership, type: :model do

  before :each do
    @membership = Membership.create do |m|
      m.name = "Membership name" 
      m.price = 300
      m.total_days = 30
      m.remaining_days = 15
      m.total_price = 300
      m.date_issued = "January"
      m.date_ending = "February"
      m.validity = true
      m.current = true
    end

  end 

  it "should be able to create a name" do
    expect(@membership.name).to eq "Membership name" 
  end

  it "should be able to create a price" do
    expect(@membership.price).to eq 300
  end

  it "should be able to create a total days" do
    expect(@membership.total_days).to eq 30
  end

  it "should be able to create a remaining days" do
    expect(@membership.remaining_days).to eq 15
  end

  it "should be able to create a total price" do
    expect(@membership.total_price).to eq 300 
  end

  it "should be able to create a date issued" do
    expect(@membership.date_issued).to eq "January" 
  end

  it "should be able to create a date ending" do
    expect(@membership.date_ending).to eq "February" 
  end

  it "should be able to create a validity" do
    expect(@membership.validity).to eq true
  end

  it "should be able to create a current" do
    expect(@membership.current).to eq true
  end

end