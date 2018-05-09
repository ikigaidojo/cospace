require 'rails_helper'

RSpec.describe Member, type: :model do
               
  before :each do
    @first                      = "Steve"
    @last                       = "Jobs"
    @phone                      = "0123456789"
    @email                      = "steve.jobs@apple.com"
    @password                   = "password"
    @Time                       = Time.zone.now
    @gender                     = "male"
   
    @member = Member.create do |m|
      m.first_name            = @first
      m.last_name             = @last
      m.phone_number          = @phone
      m.email                 = @email
      m.password              = @password
      m.time_created          = @time_created
      m.gender                = @gender
    end
  end
    
  # it "should have a first_name attribute" do
  #   expect(@member.first_name).to eq @first
  # end

  # it "should have a last_name attribute" do
  #   expect(@member.last_name).to eq @last
  # end

  # it "should have a phone_number attribute" do
  #   expect(@member.phone_number).to eq @phone
  # end

  # it "should have an email attribute" do
  #   expect(@member.email).to eq @email
  # end

  # it "should have a password attribute" do
  #   expect(@member.password).to eq @password
  # end

  # it "should have a time_created attribute" do
  #   expect(@member.time_created).to eq @time
  # end

  # it "should have a gender attribute" do
  #   expect(@member.gender).to eq @gender
  # end

  # it "needs a first_name when filling out form" do  
  #   @member.first_name      = nil # if nil is changed to something content, this should fail
  #   @member.last_name       = "Jobs"    
  #   @member.email           = "steve.jobs@apple.com"
  #   @member.save

  #   expect(@member.valid?).to eq false
  # end

  # it "needs a last_name when filling out form" do  
  #   @member.first_name      = "Steve"
  #   @member.last_name       = nil  # if nil is changed to something content, this should fail 
  #   @member.email           = "steve.jobs@apple.com"
  #   @member.save

  #   expect(@member.valid?).to eq false
  # end

  # it "needs an email when filling out form" do  
  #   @member.last_name       = "name"
  #   @member.first_name      = "mate"    
  #   @member.email           = nil   # if nil is changed to something content, this should fail
  #   @member.save

  #   expect(@member.valid?).to eq false
  # end

  # it "needs a valid email when filling out form" do  
  #   @member.email           = "steve.jobs/apple.com"   # if email is changed to a real email, this should fail, making the whole test fail
  #   @member.save          

  #   expect(@member.valid?).to eq false
  # end





# dosent work yet
  it "needs a unique name" do
    @member1 = Member.new
    @member1.email    = "steve.jobs@apple.com"    
  #should be false, so thorws error when trying to create name that already exists
    expect(@member1.valid?).to eq false
    expect(@member1.save).to eq   false
  end



end # end .describe


