require 'rspec'
require './lib/visitor'
require './lib/ride'
require './lib/carnival'

RSpec.describe do 
  before(:each) do 
    @county_fair = Carnival.new('County Fair', 14)
    @steel_drum_comp = Carnival.new('Trinidad & Tobago', 1)
    @charlottes_web = Carnival.new('Wilbur Lives', 1)
    @visitor1 = Visitor.new('Bruce', 54, '$10')
    @visitor2 = Visitor.new('Tucker', 36, '$5')
    @visitor3 = Visitor.new('Penny', 64, '$15')
  end

  it 'exists and has attributes' do
    expect(@county_fair).to be_a(Carnival)
    expect(@steel_drum_comp.day_duration).to eq(1)
    expect(@county_fair.rides).to eq([])
  end

  it 'Each carnival has rides and can list those rides' do 
    @county_fair.add_ride(@ride1 = Ride.new({ 
      name: 'Carousel', 
      min_height: 24, 
      admission_fee: 1, 
      excitement: :gentle 
      }))
    @county_fair.add_ride(@ride2 = Ride.new({ 
      name: 'Ferris Wheel', 
      min_height: 36, 
      admission_fee: 5, 
      excitement: :gentle 
      }))
    expect(@county_fair.rides).to eq([@ride1, @ride2])
  end

  it 'determines most popular ride' do
    @county_fair.add_ride(@ride1 = Ride.new({ 
      name: 'Carousel', 
      min_height: 24, 
      admission_fee: 1, 
      excitement: :gentle 
      }))
    @county_fair.add_ride(@ride2 = Ride.new({ 
      name: 'Ferris Wheel', 
      min_height: 36, 
      admission_fee: 5, 
      excitement: :gentle 
      }))
    @county_fair.add_ride(@ride3 = Ride.new({ 
        name: 'Roller Coaster', 
        min_height: 54, 
        admission_fee: 2, 
        excitement: :thrilling 
        }))
    @ride2.board_rider(@visitor1)
    @ride1.board_rider(@visitor2)
    @ride1.board_rider(@visitor1)
    @ride3.board_rider(@visitor2)
  expect(@county_fair.popular).to eq(@ride1)
  end
end