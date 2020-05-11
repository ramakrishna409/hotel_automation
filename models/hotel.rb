require 'pastel'
require 'pry'
require 'aasm'
class Hotel
  AC_POWER_CONSUMPTION = 15
  LIGHT_POWER_CONSUMPTION = 10

  attr_accessor :name, :floors, :main_corridors_count, :sub_corridors_count

  def initialize flooor_count, main_corridors_count, sub_corridors_count
    @name = 'Green Apple'
    @main_corridors_count = main_corridors_count
    @sub_corridors_count = sub_corridors_count
    @floors = []
    flooor_count.times{ @floors << Floor.new(main_corridors_count, sub_corridors_count)}
    @pastel = Pastel.new
    swith_on_all_main_corridor_lights
    switch_on_all_the_acs
  end

  def update(hotel_controller, params)
    corridor = floors[params[:floor_number]- 1].sub_corridors[params[:sub_corridor_num]- 1]
    if params[:motion_detected]
      corridor.light.turn_on if corridor.light.off?
      corridor.ac.turn_off if corridor.ac.on?
    else
      corridor.light.turn_off if corridor.light.on?
      corridor.ac.turn_on if corridor.ac.off?
    end
  end

  def swith_on_all_main_corridor_lights
    floors.each{|floor| floor.main_corridors.each{|mc| mc.light.switch}}
  end

  def switch_on_all_the_acs
    floors.each{|floor| [floor.main_corridors + floor.sub_corridors].flatten.each{|c| c.ac.switch if power_consumption <= threshold_cosumption}}
  end

  def stats
    puts self.name
    puts "Floor Count: #{floors.count}"
    floors.each_with_index do |floor, index|
     puts "Floor #{index + 1}"
     puts "Main Corriodor count: #{floor.main_corridors.count}"
     floor.main_corridors.each_with_index do |mc, index|
      puts "Main Corriodr#{index+1} light state: #{mc.light.on? ? @pastel.green('ON') : @pastel.red('OFF') } | AC: #{mc.ac.on? ? @pastel.green('ON') : @pastel.red('OFF')}"
     end
     puts "Sub Corriodor count: #{floor.sub_corridors.count}"
     floor.sub_corridors.each_with_index do |sc, index|
      puts "Sub Corriodor#{index+1} light state: #{sc.light.on? ? @pastel.green('ON') : @pastel.red('OFF')} | AC: #{sc.ac.on? ? @pastel.green('ON') : @pastel.red('OFF')}"
     end
   end
   puts "Total Power Consumption #{power_consumption}"
   puts "Threshold Power Consumption #{threshold_cosumption}"
  end

  def threshold_cosumption
    floors.count * ((main_corridors_count * AC_POWER_CONSUMPTION) + (sub_corridors_count * LIGHT_POWER_CONSUMPTION))
  end

  def power_consumption
    floors.inject(0) {|sum, floor| sum += floor.power_consumption}
  end

end
