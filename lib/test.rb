require './cell'
require './grid'
cc = Cell.new(0,4)
gg = Grid.new('800097005021400063690031074012970580067502400900100230249306750100800600080049012')
 #pp = gg.make_row(cc).to_a
gg.solve
gg.inspect
#print gg.inspect



#p gg.make_blocks