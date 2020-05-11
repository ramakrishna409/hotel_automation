class Light < Appliance 
  def power_consumption
    self.on? ? 5 : 0
  end
end
