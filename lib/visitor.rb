class Visitor
  attr_reader :name, 
              :height, 
              :preferences
  attr_accessor :spending_money, 
                :wee

  def initialize(name, height, spending_money)
    @name = name
    @height = height
    @spending_money = spending_money.delete_prefix('$').to_i
    @preferences = []
    @wee = false
  end

  def add_preference(preference)
    @preferences << preference
  end
  
  def tall_enough?
    @height >= 48
  end
end
