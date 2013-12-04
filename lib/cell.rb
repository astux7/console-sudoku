class Cell

  def initialize(value,index)
    @value = value
    @index = index
    # @neighbours = neighbours.chars.map { |element| element.to_i  } #neighbours 
    #array of cells row,colum and box
  end

  attr_accessor :value, :index
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
    existing_candidates = (1..9).to_a - neighbours
    return existing_candidates.count > 1 ? 0 : existing_candidates[0].to_i
     
  end

  def neighbours
  #  @neighbour_cells.map(&:value).uniq
    @neighbour_cells
  end

  def neighbour_cells=(cells)
    @neighbour_cells = cells
  end


  def solve
    # do nothing if solved
    # request the list of candidates and 
    # get a new value if there's only one possible candidate
    return @value if filled_out?
    have_candidates = candidates
    @value = have_candidates if have_candidates != 0 
    @value
  end

end