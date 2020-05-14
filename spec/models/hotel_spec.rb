require 'spec_helper'

RSpec.describe Hotel do 
  
  describe "#power_consumption" do 
    hotel = Hotel.new(4, 2, 2)
    
    it "should respond to power_consumption" do 
      expect(hotel.respond_to?(:power_consumption)).to be_truthy
      expect(hotel.respond_to?(:sub_corridors_count)).to be_truthy
      expect(hotel.respond_to?(:main_corridors_count)).to be_truthy
    end

    it "should give correct threshold power consumption" do
      expect(hotel.threshold_consumption).to eq 200
    end

    describe "#swith_on_all_main_corridor_lights" do 
      it "it should switch on the all main corridor lights" do 
        hotel.swith_on_all_main_corridor_lights
        expect(hotel.floors.map(&:main_corridors).flatten.map(&:light).map(&:on?)).to all(be_truthy)
      end
    end

    describe "#switch_on_all_the_acs" do 
      it "it should switch on the all the ACs" do 
        hotel.switch_on_all_the_acs
        expect((hotel.floors.map(&:main_corridors) + hotel.floors.map(&:sub_corridors)).flatten.map(&:ac).map(&:on?)).to all(be_truthy)
      end
    end

    context "when all ACs are on and lights are off in all floors" do
      it "should give proper power consumption" do 
        hotel.floors.each do |floor|
          (floor.sub_corridors + floor.main_corridors).each do |corridor| 
            corridor.ac.turn_on
            corridor.light.turn_off
          end
        end
        power_consumption = (hotel.floors.count * (hotel.floors[0].sub_corridors.count + hotel.floors[0].main_corridors.count)) * Ac::POWER_CONSUMPTION
        expect(hotel.power_consumption).to eq power_consumption
      end
    end
  end

end