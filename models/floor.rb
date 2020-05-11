class Floor
  attr_accessor :sub_corridors, :main_corridors
  
  def initialize main_corridors_count, sub_corridors_count
    @main_corridors = []
    @sub_corridors = []
    main_corridors_count.times {@main_corridors << Corriodor.new('main')}
    sub_corridors_count.times {@sub_corridors << Corriodor.new('sub')}
  end

  def power_consumption
    (main_corridors + sub_corridors).inject(0) {|sum, corridor| sum += corridor.power_consumption}
  end
end