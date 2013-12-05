require_relative '../lib/grid'
require_relative '../lib/cell'
describe Grid do
  let(:puzzle) { '015003002000100906270068430490002017501040380003905000900081040860070025037204600'} # it's an easy sudoku puzzle, row by row }
  let(:grid) { Grid.new(puzzle) }
  let(:cell) { Cell.new(0,0,[])}

  context "initialization" do
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
    it 'should print string' do
      expect(grid).to receive(:print).with("015003002\n000100906\n270068430\n490002017\n501040380\n003905000\n900081040\n860070025\n037204600")
      grid.inspect
    end
    it 'should return 4th block of  puzzle' do
      block_4  = grid.make_blocks[3]
      blocker  = block_4[0].to_a
      expect(blocker[0].value).to eq(4)
    end
    it 'should return column of 5th element in puzzle ignoring 0' do
      cc = Cell.new(0,5)
      element_5  = grid.make_column(cc)
      expect(element_5[0].value).to eq(3)
    end

    it 'should return row 5th element in puzzle ignoring 0' do
      cc = Cell.new(0,5)
      element_5  = grid.make_row(cc)
      expect(element_5[2].value).to eq(5)
    end
  end

  context "solving sudoku" do
    it "can solve the puzzle" do
      expect(grid.solved?).to be_false
      grid.solve
      expect(grid.solved?).to be_true
      expect(grid).to receive(:print).with("615493872\n348127956\n279568431\n496832517\n521746389\n783915264\n952681743\n864379125\n137254698")
      grid.inspect
    end
  end
end
