require 'observer'
require_relative 'hotel'

class HotelController
  include Observable
  attr_accessor :hotel
  

  def initialize
    @hotel = Hotel.new(4, 2, 2)
    add_observer(@hotel)
  end

  def input(params)
    changed
    # params[:motion_detected] = args[2]
    # params[:floor_number] = args[3]
    # params[:sub_corriodr_number] = args[4]
    notify_observers(self, params)
  end
end