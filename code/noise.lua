if not noise then noise = {} end

function noise.positions(chunk)
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

function noise.eval(chunk)
    local positions = noise.positions(chunk)

    --"temperature",
    --"tile:deepwater:probability",
    --"tile:grass:probability"
    local PROP_NAME = "elevation"
    local calcResults = game.surfaces.nauvis.calculate_tile_properties({ PROP_NAME }, positions)
    local noiseVals = calcResults[PROP_NAME]

    local noiseValsToPos = {}
    for index,val in ipairs(noiseVals) do
        local x = positions[index][1]
        local y = positions[index][2]
        noiseValsToPos[#noiseValsToPos+1] = { val, x, y }
    end

    return noiseValsToPos
end
