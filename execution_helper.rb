require 'pry'
Dir["./models/*.rb"].each {|file| require file }

print "Enter the number of Floors: "
total_floors = gets.chomp.to_i

print "Enter the number of Main Corridors: "
main_corridor_per_floor = gets.chomp.to_i

print "Enter the number of Sub Corridors: "
sub_corridor_per_floor = gets.chomp.to_i

hotel_controller = HotelController.new(total_floors, main_corridor_per_floor, sub_corridor_per_floor)
hotel_controller.hotel.stats
puts '------------------------------------------------------------------------------------------------'
params = {}
params[:motion_detected] = true
params[:floor_number] = 2
params[:sub_corridor_num] = 1
hotel_controller.input(params)

hotel_controller.hotel.stats
puts '------------------------------------------------------------------------------------------------'

params = {}
params[:motion_detected] = true
params[:floor_number] = 2
params[:sub_corridor_num] = 2
hotel_controller.input(params)

hotel_controller.hotel.stats

puts '------------------------------------------------------------------------------------------------'

params = {}
params[:motion_detected] = true
params[:floor_number] = 3
params[:sub_corridor_num] = 1
hotel_controller.input(params)

hotel_controller.hotel.stats