local routines = {}

local chunkToPositions = require "code/functions-lib/positions/chunk-to-positions"

-- Get raw noise values from noise generator
function routines.generateRaw(chunk, propName)
    --if chunk.x == nil then error("chunk.x == nil") end
    --if chunk.area == nil then error("chunk.area == nil") end

    local chunkPositions = chunkToPositions(chunk)

    local calcResults = game.surfaces.nauvis.calculate_tile_properties({ propName }, chunkPositions)
    --if not calcResults then error("No noise results!") end

    local noiseVals = calcResults[propName]
    --if table_size(noiseVals) < 100 then error("table_size(noiseVals) < 100 "..table_size(noiseVals)) end
    --if type(noiseVals[1]) ~= "number" then error("type(noiseVals[1]) ~= number") end

    local noiseX={}
    local noiseY={}
    for i=1,#noiseVals do
        noiseX[i] = chunkPositions[i].x
        noiseY[i] = chunkPositions[i].y
    end

    return noiseVals, noiseX, noiseY
end

-- Normalize to [0-1] scale
function routines.normalize(noiseVal, noiseX, noiseY)
    local TOP_ELEVATION = 27

    for index,_ in ipairs(noiseVal) do
        noiseVal[index] = math.min(noiseVal[index], TOP_ELEVATION) / TOP_ELEVATION
    end

    return noiseVal, noiseX, noiseY
end

return routines
