require 'cell'

class Grid
  def initialize(puzzle)
      @puzzle = puzzle
      @cells = puzzle.chars.dup.map.with_index{ |value,iter|
        Cell.new(value,set_neighbours(iter))
      }  # generate 81 cells...
  end

  def set_neighbours(x)
      rows = make_row(x).chars
      columns = make_column(x).chars
      block = make_blocks[x/9].chars
      neighbours = [rows,columns,block]
      neighbours.flatten!
      neighbours.delete_if{|x| x == "0"}
      neighbours.uniq.join
  end

   def make_blocks
    block_of_three = @puzzle.scan(/.{1,3}/)
    blocks = []
    3.times{
      0.upto(2)  {|itr|
       blocks << [block_of_three[0+itr],block_of_three[3+itr],block_of_three[6+itr]].join()
      }
      9.times {
        block_of_three.delete_at(0)
      }
    }
    blocks
  end
     
  def make_column(index)
    element_column = ""
    key = 0
    position_shift = (index%9)
    0.upto(8) {|iter|
      key = (iter * 9) + position_shift
      element_column << @puzzle[key] if @puzzle[key] != '0'
     }
    element_column
  end

  def make_row(x)
    element_column = ""
    key = (x/9)*9
    (key).upto(key+8) {|iter|
      element_column << @puzzle[iter] if @puzzle[iter] != '0'
    }
    element_column
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

