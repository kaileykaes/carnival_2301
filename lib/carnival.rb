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
    most_popular = {}
    @rides.each do |ride|
      most_popular[ride] = ride.rider_log.values
    end
    most_popular.each do |ride, values|
      most_popular[ride] = values.sum
    end
    da_best = most_popular.max_by{|ride, value| value}
    da_best[0]
  end
end
