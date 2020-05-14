require 'aasm'

class Appliance
  include AASM

  aasm whiny_transitions: false do
    state :off, initial: true
    state :on
    
    event :turn_on, after_transaction: :check_power do 
      transitions :from => :off, :to => :on, :if => [:off?, :allowed_power_consumption?]
    end

    event :turn_off do 
      transitions :from => :on, :to => :off, :if => :on?
    end
  end

  def allowed_power_consumption?
    if self.instance_of?(Light)
      self.corridor.ac.turn_off if (self.corridor.floor.power_consumption + self.class::POWER_CONSUMPTION) > self.corridor.floor.threshold_consumption
    end
    true
  end


  
end 
