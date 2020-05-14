class Ac < Appliance
  POWER_CONSUMPTION =  10
  def power_consumption
    self.on? ? POWER_CONSUMPTION : 0
  end
end
