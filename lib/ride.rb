class Ride
  attr_reader :name, 
              :min_height, 
              :admission_fee, 
              :excitement, 
              :rider_log, 
              :total_revenue

  def initialize(details)
    @name = details[:name]
    @min_height = details[:min_height]
    @admission_fee = details[:admission_fee]
    @excitement = details[:excitement]
    @rider_log = Hash.new {|hash_obj, key| hash_obj[key] = 0}
    @total_revenue = 0
  end
 
  def board_rider(visitor)
   if visitor.wee == false || rider_log.include?(visitor)
    rider_log[visitor] += 1
    # require 'pry'; binding.pry
    @total_revenue += admission_fee
    visitor.spending_money -= admission_fee
    visitor.wee = true
   end
  end
end