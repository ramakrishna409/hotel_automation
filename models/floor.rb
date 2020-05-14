class Floor
  attr_accessor :sub_corridors, :main_corridors, :hotel
  
  def initialize main_corridors_count, sub_corridors_count, hotel
    @main_corridors = []
    @sub_corridors = []
    main_corridors_count.times {@main_corridors << Corridor.new('main', self)}
    sub_corridors_count.times {@sub_corridors << Corridor.new('sub', self)}
    @hotel = hotel
  end

  def power_consumption
    (main_corridors + sub_corridors).inject(0) {|sum, corridor| sum += corridor.power_consumption}
  end

  def threshold_consumption
    (main_corridors.count * 15) + (sub_corridors.count * 10)
  end
end
