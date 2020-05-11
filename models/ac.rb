class Ac < Appliance
  def power_consumption
    self.on? ? 10 : 0
  end
end
