require 'rails_helper'

RSpec.describe PaymentConfirmation, type: :model do
 before :each do
    @paymentconfirmation = PaymentConfirmation.create do |pc|
      pc.name = "Monique" 
      pc.description = "thank you"
      pc.price = 5000
      pc.date_issued = "November 29"
    end

  end 

  it "should be able to create a name" do
    expect(@paymentconfirmation.name).to eq "Monique" 
  end

  it "should be able to create a description" do
    expect(@paymentconfirmation.description).to eq "thank you" 
  end

  it "should be able to create a price" do
    expect(@paymentconfirmation.price).to eq 5000
  end

  it "should be able to create a date_issued" do
    expect(@paymentconfirmation.date_issued).to eq "November 29" 
  end

  it "should belong to invoice" do
    should belong_to(:invoice) 
  end

end