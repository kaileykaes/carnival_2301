require 'rspec'
require './lib/ride'
require './lib/visitor'

RSpec.describe do 
  before(:each) do 
    @ride1 = Ride.new({ 
      name: 'Carousel', 
      min_height: 24, 
      admission_fee: 1, 
      excitement: :gentle 
      })
    @ride2 = Ride.new({ 
      name: 'Ferris Wheel', 
      min_height: 36, 
      admission_fee: 5, 
      excitement: :gentle 
      })
    @ride3 = Ride.new({ 
      name: 'Roller Coaster', 
      min_height: 54, 
      admission_fee: 2, 
      excitement: :thrilling 
      })
    @visitor1 = Visitor.new('Bruce', 54, '$10')
    @visitor2 = Visitor.new('Tucker', 36, '$5')
    @visitor3 = Visitor.new('Penny', 64, '$15')
    @visitor1.add_preference(:gentle)
    @visitor2.add_preference(:gentle)
  end

  it 'exists and has attributes' do 
    expect(@ride1).to be_a(Ride)
    expect(@ride1.min_height).to eq(24)
  end

  it 'has a rider log & total revenue' do 
    expect(@ride1.rider_log).to eq({})
    expect(@ride1.total_revenue).to eq(0)
  end

  it 'boards riders and logs them' do
    @ride1.board_rider(@visitor1)
    @ride1.board_rider(@visitor2)
    @ride1.board_rider(@visitor1)
    expect(@ride1.rider_log).to eq({@visitor1 => 2, @visitor2 => 1})
  end
  
  xit 'charges visitor admission' do
    @ride1.board_rider(@visitor1)
    @ride1.board_rider(@visitor2)
    @ride1.board_rider(@visitor1)
    expect(@visitor2.spending_money).to eq(4)
  end

  xit 'boards only available riders & earns money' do
    @ride1.board_rider(@visitor1)
    @ride1.board_rider(@visitor2)
    # require 'pry'; binding.pry
    @ride3.board_rider(@visitor1)
    @ride3.board_rider(@visitor2)
    @ride3.board_rider(@visitor3)
    # require 'pry'; binding.pry
    expect(@ride3.rider_log).to eq({@visitor3 => 1})
    # expect(@ride3.total_revenue).to eq(2)
  end
end