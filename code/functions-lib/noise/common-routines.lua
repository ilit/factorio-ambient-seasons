local routines = {}

local chunkToPositions = require "code/functions-lib/positions/chunk-to-positions"

-- Get raw noise values from noise generator
function routines.generateRaw(chunk, propName)
    if chunk.x == nil then error("chunk.x == nil") end
    if chunk.area == nil then error("chunk.area == nil") end

    local chunkPositions = chunkToPositions(chunk)

    local calcResults = game.surfaces.nauvis.calculate_tile_properties({ propName }, chunkPositions)
    if not calcResults then error("No noise results!") end

    local noiseVals = calcResults[propName]
    if table_size(noiseVals) < 100 then error("table_size(noiseVals) < 100 "..table_size(noiseVals)) end
    if type(noiseVals[1]) ~= "number" then error("type(noiseVals[1]) ~= number") end

    local noiseValsAndPos = {}
    for index,val in ipairs(noiseVals) do
        local x = chunkPositions[index].x
        local y = chunkPositions[index].y
        if type(x) ~= "number" then error("type(x) ~= number but "..type(x)) end
        noiseValsAndPos[index] = {}
        noiseValsAndPos[index].val = val
        noiseValsAndPos[index].x = x
        noiseValsAndPos[index].y = y
    end

    if table_size(noiseValsAndPos) < 100 then error("table_size(noiseValsToPos) == "..table_size(noiseValsAndPos)) end
    if noiseValsAndPos[1] == nil then error("noiseValsToPos[1] == nil "..table_size(noiseValsAndPos)) end
    if noiseValsAndPos[1].val == nil then error("noiseValsToPos[1].val == nil") end
    if noiseValsAndPos[1].x == nil then error("noiseValsToPos[1].x == nil "..table_size(noiseValsAndPos)) end

    return noiseValsAndPos
end

-- Normalize to [0-1] scale
function routines.normalize(rawNoiseValsToPos)
    local TOP_ELEVATION = 27

    local ret = {}
    for _, triplet in ipairs(rawNoiseValsToPos) do
        local rawNoise = triplet.val
        local capped = math.min(rawNoise, TOP_ELEVATION)
        local normalized = capped / TOP_ELEVATION

        ret[#ret +1] = {}
        ret[#ret].val = normalized
        ret[#ret].x = triplet.x
        ret[#ret].y = triplet.y
    end

    return ret
end

return routines
