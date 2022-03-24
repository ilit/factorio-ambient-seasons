local positions = {}
positions.chunk = {}

function positions.chunk.getPositionsArray(chunk)
    local chunkPositions = {}
    for x = chunk.area.left_top.x,chunk.area.right_bottom.x,1
    do
        for y = chunk.area.left_top.y,chunk.area.right_bottom.y,1
        do
            chunkPositions[#chunkPositions+1] = { x, y }
        end
    end
    return chunkPositions
end

return positions
