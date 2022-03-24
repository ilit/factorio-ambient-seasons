local positions = {}
positions.chunk = {}

function positions.chunk.getPositionsArray(chunk)
    local chunkPositions = {}
    for x = chunk.area.left_top.x + 3, chunk.area.right_bottom.x - 3, 1
    do
        for y = chunk.area.left_top.y + 3, chunk.area.right_bottom.y - 3, 1
        do
            chunkPositions[#chunkPositions+1] = { x, y }
        end
    end
    --game.print("#chunkPositions " .. #chunkPositions)
    return chunkPositions
end

return positions
