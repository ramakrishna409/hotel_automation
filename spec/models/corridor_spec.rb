require 'spec_helper'

RSpec.describe Corridor do 
  
  describe "#power_consumption" do 
    hotel = Hotel.new(2, 2, 2)
    floor = Floor.new(2, 2, hotel)
    corridor = Corridor.new('main', floor)
    
    it "should respond to power_consumption" do 
      expect(corridor.respond_to?(:power_consumption)).to be_truthy
      expect(corridor.respond_to?(:light)).to be_truthy
      expect(corridor.respond_to?(:ac)).to be_truthy
      expect(corridor.respond_to?(:type)).to be_truthy
    end

    context "when both light and ac is turned off" do
      it "should give the correct corridor power consumption" do 
        corridor.light.turn_off
        corridor.ac.turn_off
        expect(corridor.power_consumption).to eq 0
      end
    end

    context "when both light and ac is turned on" do
      it "should give the correct corridor power consumption" do 
        corridor.light.turn_on
        corridor.ac.turn_on
        expect(corridor.power_consumption).to eq Light::POWER_CONSUMPTION + Ac::POWER_CONSUMPTION
      end
    end
    context "when light is off and ac is on" do
      it "should give the correct corridor power consumption" do 
        corridor.light.turn_off
        corridor.ac.turn_on
        expect(corridor.power_consumption).to eq Ac::POWER_CONSUMPTION
      end
    end

    context "when light is on and ac is off" do
      it "should give the correct corridor power consumption" do 
        corridor.light.turn_on
        corridor.ac.turn_off
        expect(corridor.power_consumption).to eq Light::POWER_CONSUMPTION
      end
    end
  end

end