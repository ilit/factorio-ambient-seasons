return function(chunk)
    if chunk.area == nil then error("chunk.area == nil") end

    local positions = {}
    for x = chunk.area.left_top.x + 1, chunk.area.right_bottom.x - 1, 1
    do
        for y = chunk.area.left_top.y + 1, chunk.area.right_bottom.y - 1, 1
        do
            positions[#positions +1] = { x, y }
        end
    end

    return positions
end
