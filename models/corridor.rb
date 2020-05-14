class Corridor
  attr_accessor :type, :light, :ac, :floor
  
  def initialize type, floor
    @type = type
    @light = Light.new(self)
    @ac = Ac.new
    self.floor = floor
  end

  def power_consumption
    @light.power_consumption + @ac.power_consumption
  end
end