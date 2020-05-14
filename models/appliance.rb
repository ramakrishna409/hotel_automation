require 'aasm'

class Appliance
  include AASM

  aasm whiny_transitions: false do
    state :off, initial: true
    state :on, before_enter: :turn_off_ac_if_necessary
    
    event :turn_on do 
      transitions :from => :off, :to => :on, :if => :off?
    end

    event :turn_off do 
      transitions :from => :on, :to => :off, :if => :on?
    end
  end

  def turn_off_ac_if_necessary
    if self.instance_of?(Light)
      self.corridor.ac.turn_off if (self.corridor.floor.power_consumption + self.class::POWER_CONSUMPTION) > self.corridor.floor.threshold_consumption
    end
  end
end 
