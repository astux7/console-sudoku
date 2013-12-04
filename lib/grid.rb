require_relative './cell'

class Grid
  def initialize(puzzle)
    
      @puzzle = puzzle
      @cells = puzzle.chars.dup.each_with_index.map{ |value,iter|
        Cell.new(value.to_i,iter.to_i)
      }  # generate 81 cells...
      @cells.each do |cell|
       #cell.neighbour_cells = neighbour_indicies(cell).map{|i| @cells[i] }
        cell.neighbour_cells = neighbour_indicies(cell)#.map{|c| @cells[c]}
      end
  end


  def neighbour_indicies(cell)
    neighbours = []
     rows = make_row(cell)
     columns = make_column(cell)
     block = make_blocks[cell.index/9]
     neighbours = [rows,columns,block]
     neighbours.flatten!
     neighbours
    #  neighbours.flatten!
    #  neighbours.delete_if{|x| x == "0"}
    #  neighbours.uniq.join
  end

   def make_blocks
    block_of_three = @cells.each_slice(3).to_a
    blocks = []
    3.times{
      0.upto(2)  {|itr|
       blocks << [block_of_three[0+itr].index,block_of_three[3+itr].index,block_of_three[6+itr].index]
      }
      9.times {
        block_of_three.delete_at(0)
      }
    }
    blocks
  end
     
  def make_column(cell)
    element_column = []
    key = 0
    position_shift = (cell.index%9)
    0.upto(8) {|iter|
      key = (iter * 9) + position_shift
      element_column << @cells[key] #if @cells[key].value != '0'
     }
    element_column
  end

  def make_row(cell)
    element_column = []
    key = (cell.index/9)*9
    (key).upto(key+8) {|iter|
      element_column << @cells[iter] # if @cells[iter].value != '0'
    }
    element_column
  end

  attr_reader :cells

    #to solve the puzzle
  def solve
    outstanding_before, looping = @cells.count, false
    while !solved? && !looping
      try_to_solve # ask each cell to solve itself
      outstanding         = @cells.count {|c| c.filled_out? }
      looping             = outstanding_before == outstanding       
      outstanding_before  = outstanding     
    end 
  end
  
  def cells_count
    @cells.count
  

  end

  def try_to_solve
    @cells.each{ |cell| cell.solve }
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
        temp += row.value.to_s
        temp +="\n" if iterator % 9 == 0
        iterator +=1
    }
    print temp.chomp
  end

end

