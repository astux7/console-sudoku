require_relative '../lib/grid'
describe Grid do
  context "initialization" do
    let(:puzzle) { '015003002000100906270068430490002017501040380003905000900081040860070025037204600'} # it's an easy sudoku puzzle, row by row }
    let(:grid) { Grid.new(puzzle) }
    it 'should have 81 cells' do
      expect(grid.cells_count).to eq(81)
    end
    it 'should have an unsolved first cell' do
       expect(grid.cells.first.filled_out?).to be_false
    end
    it 'should have a solved second cell with value 1' do
      expect(grid.cells[1].filled_out?).to be_true
    end
    it 'should have still not solved cells' do
      expect(grid.solved?).to be_false
    end
  end
end