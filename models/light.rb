class Light < Appliance
  POWER_CONSUMPTION =  5
  attr_accessor :corridor

  def initialize corridor
    self.corridor = corridor
  end

  def power_consumption
    self.on? ? POWER_CONSUMPTION : 0
  end
end
