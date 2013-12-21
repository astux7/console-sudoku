require_relative '../lib/cell'

describe Cell do
  let(:cell) { Cell.new(0,0,[]) }
	it 'should be initialized' do
		expect(cell.value).to eq(0)
	end
	it 'should tell that cell is not filled out or not' do
     expect(cell.filled_out?).to be_false
     cell.value = '1'
     expect(cell.filled_out?).to be_true
	end
  it 'should return candidates of the cell' do
     cell1, cell2, cell3 = Cell.new(5,5,[]),Cell.new(6,7,[]),Cell.new(2,4,[])
     cells = [cell1, cell2, cell3]
     cell.neighbour_cells = cells
     expect(cell.candidates).to eq([1, 3, 4, 7, 8, 9])
  end
  it 'should return old value if not find one candidate' do 
     cell1, cell2, cell3 = Cell.new(5,5,[]),Cell.new(6,7,[]),Cell.new(2,4,[])
     cells = [cell1, cell2, cell3]
     cell.neighbour_cells = cells
     cell.solve
     expect(cell.filled_out?).to be_false
  end

  it "should solve itself if only one value is possible" do
    neighbours = ((1..9).to_a - [5]).map{|n| Cell.new(n, 0)}
    cell.neighbour_cells = neighbours
    expect(cell).not_to be_filled_out
    cell.solve
    expect(cell).to be_filled_out
    expect(cell.value).to eq(5)
  end

end