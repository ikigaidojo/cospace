require 'rails_helper'

  RSpec.describe Member, type: :model do
    @first  = "Steve"
    @last   = "Jobs"
    
    before :each do
      @member = Member.create do |m|
        m.first_name              = @first
        m.last_name               = @last
    end

  end

  it "should have a first name attribute" do
    expect(@member.first_name).to eq @first
  end

  it "should have a last name attribute" do
    expect(@member.last_name).to eq @last
  end

end # end of rails


