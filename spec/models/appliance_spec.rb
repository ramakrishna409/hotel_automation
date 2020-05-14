require 'spec_helper'

RSpec.describe Appliance do 

  appliance = Appliance.new
  
  it "should respond to proper Appliance events" do 
    expect(appliance.respond_to?(:turn_on)).to be_truthy
    expect(appliance.respond_to?(:turn_off)).to be_truthy
    #expect(appliance.respond_to?(:turn_off_ac_)).to be_truthy
  end

end