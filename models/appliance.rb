require 'aasm'

class Appliance
  include AASM

  aasm do
    state :off, initial: true
    state :on
    
    event :switch do
      transitions :from => :on, :to => :off, :if => :on?
      transitions :from => :off, :to => :on, :if => :off?
    end

    event :turn_on do 
      transitions :from => :off, :to => :on, :if => :off?
    end

    event :turn_off do 
      transitions :from => :on, :to => :off, :if => :on?
    end
  end
end 
