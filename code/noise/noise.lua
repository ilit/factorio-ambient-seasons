if not noise then noise = {} end
positions = require "code/functions-lib/positions/positions"

-- Get raw noise values from noise generator
function noise.generateRaw(chunk)
    local chunkPositions = positions.chunk.getPositionsArray(chunk)

    --"temperature",
    --"tile:deepwater:probability",
    --"tile:grass:probability"
    local PROP_NAME = "elevation"
    local calcResults = game.surfaces.nauvis.calculate_tile_properties({ PROP_NAME }, chunkPositions)
    local noiseVals = calcResults[PROP_NAME]

    local noiseValsToPos = {}
    for index,val in ipairs(noiseVals) do
        local x = chunkPositions[index][1]
        local y = chunkPositions[index][2]
        noiseValsToPos[#noiseValsToPos+1] = { val, x, y }
    end

    return noiseValsToPos
end

-- Normalize to [0-1] scale
function noise.normalize(rawNoiseValsToPos)
    local TOP_ELEVATION = 27

    local ret = {}
    for i, triplet in ipairs(rawNoiseValsToPos) do
        local rawNoise = triplet[1]
        local capped = math.min(rawNoise, TOP_ELEVATION)
        local normalized = capped / TOP_ELEVATION

        local x = triplet[2]
        local y = triplet[3]

        ret[#ret +1] =
        { normalized, x, y }
    end

    return ret
end

return noise
