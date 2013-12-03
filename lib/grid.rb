require 'cell'

class Grid
  def initialize(puzzle)
    @cells = puzzle.chars.map.with_index { |val,index|
      Cell.new(val,index,self)
    }  # generate 81 cells...
   # @cells.each{|c| set_neigbours(c)}
  end

  attr_reader :cells

  #to solve the puzzle
  def solve
    outstanding_before, looping = @cells.count, false
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
    @cells.each{ |cell|
      cell.solve
    }
  end

  def solved?
    # a grid if solved if all cells are filled out. Use .all? method
    @cells.all?{|c| c.filled_out?}
  end
  
  def inspect
    # iterate over all cells and print the grid
    iterator = 1
    temp = ""
    @cells.each{ |row|
        temp += row.value 
        temp +="\n" if iterator % 9 == 0
        iterator +=1
    }
    print temp.chomp

  end

end

#gg = Grid.new('015003002000100906270068430490002017501040380003905000900081040860070025037204600')
#gg .inspect
