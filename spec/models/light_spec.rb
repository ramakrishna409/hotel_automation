require 'spec_helper'

RSpec.describe Light do 
  
  describe "#power_consumption" do 
    hotel = Hotel.new(2, 2, 2)
    floor = Floor.new(2, 2, hotel)
    corridor = Corridor.new('main', floor)
    light = Light.new(corridor)
    
    it "should respond to proper light events" do 
      expect(light.respond_to?(:turn_on)).to be_truthy
      expect(light.respond_to?(:turn_off)).to be_truthy
      expect(light.respond_to?(:power_consumption)).to be_truthy
    end

    it "should inherit from Appliance" do
      expect(Light).to be < Appliance
    end

    context "when light is turned off" do
      it "should give the light power consumption as zero" do 
        light.turn_off
        expect(light.power_consumption).to eq 0
      end
    end

    context "when light is turned on" do
      it "should give the light power consumption as 5" do 
        light.turn_on
        expect(light.power_consumption).to eq Light::POWER_CONSUMPTION
      end
    end
  end

end