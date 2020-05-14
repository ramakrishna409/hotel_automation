require 'spec_helper'

RSpec.describe HotelController do 
  hotel_controller = HotelController.new(4, 2, 2)
  it "should run accurately for sequnce of continues events" do 

    #First Run, sub corriodor lights should be off, all other ON

    hotel_controller.hotel.floors.each do |floor|
      floor.main_corridors.each  do |corridor|
        expect(corridor.light.on?).to be_truthy
        expect(corridor.ac.on?).to be_truthy
      end

      floor.sub_corridors.each  do |corridor|
        expect(corridor.light.on?).to be_falsey
        expect(corridor.ac.on?).to be_truthy
      end
      expect(hotel_controller.hotel.power_consumption).to be <= hotel_controller.hotel.threshold_consumption
    end


    #Motion detected in 2nd floor 2nd sub corridor
    params = {}
    params[:motion_detected] = true
    params[:floor_number] = 2
    params[:sub_corridor_num] = 2
    hotel_controller.input(params)

    floor_2 = hotel_controller.hotel.floors[1]
    sub_corriodr2 = floor_2.sub_corridors[1]
    expect(sub_corriodr2.light.on?).to be_truthy
    expect(hotel_controller.hotel.power_consumption).to be <= hotel_controller.hotel.threshold_consumption


    #No Motion detected in 2nd floor 2nd sub corridor
    params = {}
    params[:motion_detected] = false
    params[:floor_number] = 2
    params[:sub_corridor_num] = 2
    hotel_controller.input(params)
    floor_2 = hotel_controller.hotel.floors[1]
    sub_corriodr2 = floor_2.sub_corridors[1]
    expect(sub_corriodr2.light.on?).to be_falsey
    expect(sub_corriodr2.ac.on?).to be_truthy
    expect(hotel_controller.hotel.power_consumption).to be <= hotel_controller.hotel.threshold_consumption


    #No Motion detected in 2nd floor 2nd sub corridor
    params = {}
    params[:motion_detected] = false
    params[:floor_number] = 2
    params[:sub_corridor_num] = 2
    hotel_controller.input(params)
    floor_2 = hotel_controller.hotel.floors[1]
    sub_corriodr2 = floor_2.sub_corridors[1]
    expect(sub_corriodr2.light.on?).to be_falsey
    expect(sub_corriodr2.ac.on?).to be_truthy
    expect(hotel_controller.hotel.power_consumption).to be <= hotel_controller.hotel.threshold_consumption
  end

end