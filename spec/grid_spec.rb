require_relative '../lib/grid'
describe Grid do
  let(:puzzle) { '015003002000100906270068430490002017501040380003905000900081040860070025037204600'} # it's an easy sudoku puzzle, row by row }
  let(:grid) { Grid.new(puzzle) }
    

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


  end




    context "solving sudoku" do
    
     

    it "can solve the puzzle" do
      expect(grid.solved?).to be_false
      #grid.solve
     # expect(grid.solved?).to be_true
     # expect(grid.to_s).to eq('615493872348127956279568431496832517521746389783915264952681743864379125137254698')
    end
  end
end