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
    @rider_log = Hash.new(0)
    @total_revenue = 0
  end
 
  def board_rider(visitor)
    # require 'pry'; binding.pry
    if @rider_log.include?(visitor) || visitor.wee == false
      @rider_log[visitor] += 1 
      visitor.wee = true
    end
    # visitor.spending_money -= @admission_fee
    @total_revenue += @admission_fee
  end
end

# # visitor.spending_money - @admission_fee
# # unless visitor.wee == true
# #    @rider_log[visitor] += 1 
#    visitor.wee = true
# # end