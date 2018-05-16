require 'rails_helper'

RSpec.describe Invoice, type: :model do
  
  before :each do 
    @invoice_name         = "Invoice 2"
    @description  = "An automated invoice from co-space"
    @date_paid    = Time.zone.now
    @price        = 1000
    @status       = "pending"
    @location     = "https://www.google.com.ph/maps/place/Launchgarage+Innovation+Hub/@14.600951,121.0876206,14.7z/data=!4m12!1m6!3m5!1s0x0:0x108b1eabcb21486f!2sLaunchgarage+Innovation+Hub!8m2!3d14.6008212!4d121.0880594!3m4!1s0x0:0x108b1eabcb21486f!8m2!3d14.6008212!4d121.0880594"

    @invoice = Invoice.create do |i|
      i.invoice_name = @invoice_name
      i.description  = @description
      i.date_paid    = @date_paid      # remember this is a date/time (if not paid, then make this the date_due)
      i.price        = @price          # remember this is an integer
      i.status       = @status
      i.location     = @location
    end
  end

  it "should create an invoice model" do
    expect(@invoice.valid?).to eq true
    expect(@invoice.save).to eq true
  end

  it "should have an invoice_name attribute" do
    expect(@invoice.invoice_name).to eq @invoice_name
    expect(@invoice.save).to eq true
  end

  it "should create a description attribute" do
    expect(@invoice.description).to eq @description
    expect(@invoice.save).to eq true
  end

  it "should create a date_paid attribute" do
    expect(@invoice.date_paid).to eq @date_paid
    expect(@invoice.save).to eq true
  end

  it "should create a price attribute" do
    expect(@invoice.price).to eq @price
    expect(@invoice.save).to eq true
  end

  it "ensure price attribute is an integer and is positive" do
    @invoice.price = -1
    expect(@invoice.valid?).to eq false
    expect(@invoice.save).to eq false
  end

  it "should create a location attribute" do
    expect(@invoice.location).to eq @location
    expect(@invoice.save).to eq true
  end

  it "should create a status attribute" do
    expect(@invoice.status).to eq @status
    expect(@invoice.save).to eq true
  end

  it "should belong to member" do
    should belong_to(:member)
  end

  it "should have many payment confirmations" do
    should have_many(:payment_confirmations)
  end

end

