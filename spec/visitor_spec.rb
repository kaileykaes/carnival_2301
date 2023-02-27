require 'rspec'
require './lib/visitor'

RSpec.describe do 
  before(:each) do 
    @visitor1 = Visitor.new('Bruce', 54, '$10')
    @visitor2 = Visitor.new('Tucker', 36, '$5')
    @visitor3 = Visitor.new('Penny', 64, '$15')
  end

  it 'exists and has attributes' do
    expect(@visitor1).to be_a(Visitor)
    expect(@visitor1.name).to eq('Bruce')
    expect(@visitor1.height).to eq(54)
    expect(@visitor1.spending_money).to eq(10)
    expect(@visitor1.preferences).to eq([])
  end

  it 'can add preferences' do 
    @visitor1.add_preference(:gentle)
    expect(@visitor1.add_preference(:water)).to eq([:gentle, :water])
  end

  it 'determines acceptable height' do
    expect(@visitor2.tall_enough?).to eq(false)
    expect(@visitor1.tall_enough?).to eq(true)
  end

end