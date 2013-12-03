describe Grid do
  context "initialization" do
    let(:puzzle) { '015003002000100906270068430490002017501040380003905000900081040860070025037204600' # it's an easy sudoku puzzle, row by row }
    let(:grid) { Grid.new(puzzle) }
    it 'should have 81 cells' do
    end
    it 'should have an unsolved first cell' do
    end
    it 'should have a solved second cell with value 1' do
    end
  end
end