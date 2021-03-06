class Cell

  def initialize(value,index,neighbour_cells = [])
    @value = value
    @index = index
    @neighbour_cells = []
    #array of cells row,colum and box
  end

  attr_accessor :value, :index, :neighbour_cells
  # returns true if the cell is filled out, false otherwise
  def filled_out?
    @value == 0 ? false : true
    # it may be convenient (depending on your design) to use
    # 0 as the "unsolved" value for the cell. This way
    # you won't have to differentiate between numbers and nil
    # values when you calculate neighbours.
  end
  #calculate the candidates for the specific cell
  #substracting from 1..9 what can be if more 1 skip
  def candidates
    possible_candidates = []
    @neighbour_cells.flatten.each{ |cell|
      possible_candidates << cell.value 
    }
    existing_candidates = (1..9).to_a - possible_candidates.uniq
  end
  
  def solve
    # do nothing if solved
    # request the list of candidates and 
    # get a new value if there's only one possible candidate
    candidates_range =  candidates
    return @value = candidates_range[0]  if candidates_range.count == 1
    @value 
  end

end