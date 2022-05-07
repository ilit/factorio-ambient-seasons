stdLib = {} --- Stub this to stop __stdlib__ imports
local chunkToPos = require "code/functions-lib/positions/chunk-to-positions-factorio"

local chPos = {}

function chPos:testPos()
    local chunk = {}
    chunk.area = {}
    chunk.area.left_top = {}
    chunk.area.left_top.x = 1
    chunk.area.left_top.y = 1
    chunk.area.right_bottom = {}
    chunk.area.right_bottom.x = 3
    chunk.area.right_bottom.y = 3

    local positions = chunkToPos(chunk)
    assertEquals(positions, {
            {x=1, y=1},
            {x=1, y=2},
            {x=1, y=3},
            {x=2, y=1},
            {x=2, y=2},
            {x=2, y=3},
            {x=3, y=1},
            {x=3, y=2},
            {x=3, y=3}})
end

return chPos
