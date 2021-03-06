local constants = require "code/constants"
if not constants.BOSKID_DIRTY_ASS_HACK then error("not constants.BOSKID_DIRTY_ASS_HACK") end
if not stdLib then stdLib = require('external/stdlib-imports') end
local Chunk = stdLib.chunk

--- Arrays of structs

return function(chunk)
    if chunk.area == nil then
        if chunk.x == nil then error("chunk.x == nil") end
        chunk.area = Chunk.to_area({x=chunk.x, y=chunk.y})
    end
    if chunk.area.left_top.x == nil then error("chunk.area == nil") end
    if type(chunk.area.left_top.x) ~= "number" then error("type(chunk.area.left_top.x) ~= number "..type(positions[1].x)) end

    local positions = {}
    for x = chunk.area.left_top.x, chunk.area.right_bottom.x + constants.BOSKID_DIRTY_ASS_HACK
    do
        for y = chunk.area.left_top.y, chunk.area.right_bottom.y + constants.BOSKID_DIRTY_ASS_HACK
        do
            positions[#positions+1] = {}
            positions[#positions].x = x
            positions[#positions].y = y
        end
    end

    if type(positions[1].x) ~= "number" then error("type(positions[1].x) ~= number but "..type(positions[1].x)) end

    return positions
end
