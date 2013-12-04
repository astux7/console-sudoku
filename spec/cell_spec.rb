require_relative '../lib/cell'

describe Cell do
  let(:cell) { Cell.new(0) }
	it 'should be initialized' do
		expect(cell.value).to eq(0)
	end
	it 'should tell that cell is not filled out or not' do
    expect(cell.filled_out?).to be_false
    cell.value = '1'
    expect(cell.filled_out?).to be_true
	end
  it 'should return a new value if count of candidates is 1' do
    cell.value = 0
    expect(cell.solve).to eq(7) 
  end
  

end