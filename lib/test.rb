require './cell'
require './grid'
cc = Cell.new(0,4)
gg = Grid.new('015003002000100906270068430490002017501040380003905000900081040860070025037204600')
 #pp = gg.make_row(cc).to_a
pp = gg.make_blocks

print gg.inspect



#p gg.make_blocks