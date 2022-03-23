if not noise then noise = {} end
if not noise.chunk then noise.chunk = {} end

function noise.chunk.getPositionsArray(chunk)
    local positions = {}
    for x = chunk.area.left_top.x,chunk.area.right_bottom.x,1
    do
        for y = chunk.area.left_top.y,chunk.area.right_bottom.y,1
        do
            positions[#positions+1] = { x, y }
        end
    end
    return positions
end