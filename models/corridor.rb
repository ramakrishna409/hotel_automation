class Corriodor
  attr_accessor :type, :light, :ac
  
  def initialize type
    @type = type
    @light = Light.new
    @ac = Ac.new
  end

  def power_consumption
    @light.power_consumption + @ac.power_consumption
  end
end