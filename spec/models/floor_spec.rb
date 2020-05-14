require 'spec_helper'

RSpec.describe Floor do 
  
  describe "#power_consumption" do 
    floor = Floor.new(2, 2, self)
    
    it "should respond to power_consumption" do 
      expect(floor.respond_to?(:power_consumption)).to be_truthy
      expect(floor.respond_to?(:sub_corridors)).to be_truthy
      expect(floor.respond_to?(:main_corridors)).to be_truthy
    end

    context "when all ACs are on and lights are off" do
      it "should give proper power consumption" do 
        (floor.sub_corridors + floor.main_corridors).each do |corridor| 
          corridor.ac.turn_on
          corridor.light.turn_off
        end
        expect(floor.power_consumption).to eq (floor.sub_corridors.count + floor.main_corridors.count) * Ac::POWER_CONSUMPTION
      end
    end
  end

end