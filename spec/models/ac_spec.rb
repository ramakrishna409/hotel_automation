require 'spec_helper'

RSpec.describe Ac do 
  
  describe "#power_consumption" do 
    ac = Ac.new
    
    it "should respond to proper Ac events" do 
      expect(ac.respond_to?(:turn_on)).to be_truthy
      expect(ac.respond_to?(:turn_off)).to be_truthy
      expect(ac.respond_to?(:power_consumption)).to be_truthy
    end

    it "should inherit from Appliance" do
      expect(Ac).to be < Appliance
    end

    context "when Ac is turned off" do
      it "should give the Ac power consumption as zero" do 
        ac.turn_off
        expect(ac.power_consumption).to eq 0
      end
    end

    context "when Ac is turned on" do
      it "should give the Ac power consumption as 5" do 
        ac.turn_on
        expect(ac.power_consumption).to eq Ac::POWER_CONSUMPTION
      end
    end
  end

end