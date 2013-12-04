require_relative '../lib/cell'

describe Cell do
  let(:cell) { Cell.new(0,0) }
	it 'should be initialized' do
		expect(cell.value).to eq(0)
	end
	it 'should tell that cell is not filled out or not' do
     expect(cell.filled_out?).to be_false
     cell.value = '1'
    expect(cell.filled_out?).to be_true
	end
  it 'should return a new value if count of candidates is 1' do
 #   expect(cell.candidates).to eq(9) 
  end
  it 'should return new value if found candidate' do 
  # expect(cell.solve).to eq(9)
  end
  

end