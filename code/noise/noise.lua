if not noise then noise = {} end

function noise.eval(chunk)
    positions = require "code/functions-lib/positions/positions"
    local chunkPositions = positions.chunk.getPositionsArray(chunk)

    --"temperature",
    --"tile:deepwater:probability",
    --"tile:grass:probability"
    local PROP_NAME = "elevation"
    local calcResults = game.surfaces.nauvis.calculate_tile_properties({ PROP_NAME }, positions)
    local noiseVals = calcResults[PROP_NAME]

    local noiseValsToPos = {}
    for index,val in ipairs(noiseVals) do
        local x = chunkPositions[index][1]
        local y = chunkPositions[index][2]
        noiseValsToPos[#noiseValsToPos+1] = { val, x, y }
    end

    return noiseValsToPos
end
