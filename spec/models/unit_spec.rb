require 'rails_helper'

RSpec.describe Unit, type: :model do
  
  before :each do
	  @label = "per hour"
	  @description = "per hour"
	
	  @unit = Unit.create do |m|
		  m.label = @label
		  m.description = @description
	  end
  end

  it "should be able to create a label attribute" do
    expect(@unit.label).to eq @label
  end

  it "should be able to create a description attribute" do
    expect(@unit.description).to eq @description
  end
end
