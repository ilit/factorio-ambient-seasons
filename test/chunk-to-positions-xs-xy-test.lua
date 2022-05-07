local chunkToPos = require "code/functions-lib/positions/chunk-to-positions-arrays"

local chPos = {}

function chPos:testXsYs()
    local chunk = {}
    chunk.area = {}
    chunk.area.left_top = {}
    chunk.area.left_top.x = 1
    chunk.area.left_top.y = 1
    chunk.area.right_bottom = {}
    chunk.area.right_bottom.x = 3
    chunk.area.right_bottom.y = 3

    local xs, ys = chunkToPos(chunk)
    assertEquals(xs, {1, 1, 1, 2, 2, 2, 3, 3, 3} )
    assertEquals(ys, {1, 2, 3, 1, 2, 3, 1, 2, 3} )
end

return chPos
