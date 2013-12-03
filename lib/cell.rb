class Cell

  def initialize(value, neighbours = Array.new())
    @value = value
    @neighbours = neighbours #neighbours 
    #array of cells row,colum and box
  end

  attr_accessor :value, :neighbours
  # returns true if the cell is filled out, false otherwise
  def filled_out?
    value.to_i == 0 ? false : true
    # it may be convenient (depending on your design) to use
    # 0 as the "unsolved" value for the cell. This way
    # you won't have to differentiate between numbers and nil
    # values when you calculate neighbours.
  end
  #calculate the candidates for the specific cell
  #substracting from 1..9 what can be if more 1 skip
  def candidates
     
  end

  def solve
    # do nothing if solved
    # request the list of candidates and 
    # get a new value if there's only one possible candidate

end



end