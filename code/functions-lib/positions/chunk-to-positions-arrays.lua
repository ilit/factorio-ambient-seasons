--- Two Arrays of x and y

return function(chunk)
    if chunk.area == nil then error("chunk.area == nil") end
    if chunk.area.left_top.x == nil then error("chunk.area == nil") end
    --if type(chunk.area.left_top.x) ~= "number" then error("type(chunk.area.left_top.x) ~= number "..type(positions[1].x)) end

    local xs = {}
    local ys = {}
    for x = chunk.area.left_top.x, chunk.area.right_bottom.x
    do
        for y = chunk.area.left_top.y, chunk.area.right_bottom.y
        do
            xs[#xs+1] = x
            ys[#ys+1] = y
        end
    end

    return xs, ys
end
