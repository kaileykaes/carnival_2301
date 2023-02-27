class Carnival
  attr_reader :name, 
              :day_duration, 
              :rides
  
  def initialize(name, day_duration)
    @name = name
    @day_duration = day_duration
    @rides = []
  end

  def add_ride(ride)
    @rides << ride
  end

  def popular
    
  end
end
