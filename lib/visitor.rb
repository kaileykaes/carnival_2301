class Visitor
  attr_reader :name, 
              :height, 
              :preferences,
              :spending_money

  def initialize(name, height, spending_money)
    @name = name
    @height = height
    @spending_money = spending_money.delete_prefix('$').to_i
    @preferences = []
  end

  def add_preference(preference)
    @preferences << preference
  end
  
  def tall_enough?
    @height >= 48
  end
end
