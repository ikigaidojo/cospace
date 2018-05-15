require 'rails_helper'

RSpec.describe Admin, type: :model do
  
  before :each do
    @first = "Monique"
    @last  = "Manansala"
    @email = "moniquemanansala29@gmail.com"

    @member = Admin.create do |m|
      m.first_name = @first
      m.last_name  = @last    
      m.email      = @email
    end
  end
    
  it "should have a first_name attribute" do
    expect(@member.first_name).to eq @first
  end

  it "should have a last_name attribute" do
    expect(@member.last_name).to eq @last
  end

  it "should have an email attribute" do
    expect(@member.email).to eq @email
  end

  it "should 'have_many resources" do
    should have_many(:resources)
  end

end
