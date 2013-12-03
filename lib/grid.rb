require 'cell'

class Grid
  def initialize(puzzle)
    @cells = []
    puzzle.chars.each do |val|
      @cells << Cell.new(val)
    end  #Array.new(81){ 0 }   # generate 81 cells...
  end

  attr_reader :cells

  #to solve the puzzle
  def solve
    outstanding_before, looping = SIZE, false
    while !solved? && !looping
      try_to_solve # ask each cell to solve itself
      outstanding         = @cells.count {|c| c.solved? }
      looping             = outstanding_before == outstanding       
      outstanding_before  = outstanding     
    end 
  end
  
  def cells_count
    @cells.count
  end

  def try_to_solve


  end

  def solved?
    # a grid if solved if all cells are filled out. Use .all? method
    @cells.all?{|c| c.filled_out?}
  end
  
  def inspect
    # iterate over all cells and print the grid
    iterator = 1
    @cells.each{ |row|
        print row 
        puts if iterator % 9 == 0
        iterator +=1
    }
  end

end
