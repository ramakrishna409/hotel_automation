require 'observer'

Dir["./models/*.rb"].each {|file| require file }

class HotelController
  include Observable
  attr_accessor :hotel
  
  def initialize total_floors, main_corridor_per_floor, sub_corridor_per_floor
    self.hotel =  Hotel.new(total_floors, main_corridor_per_floor, sub_corridor_per_floor)
    add_observer(self.hotel)
  end

  def input(params)
    changed
    notify_observers(self, params)
  end
end
