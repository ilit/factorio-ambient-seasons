local routines = {}

local chunkToPositions = require "code/functions-lib/positions/chunk-to-positions"
local constants = require "code/constants"

-- Get raw noise values from noise generator
function routines.generateRaw(chunk, propName)
    --if chunk.x == nil then error("chunk.x == nil") end
    --if chunk.area == nil then error("chunk.area == nil") end

    local chunkPositions = chunkToPositions(chunk)

    local calcResults = game.surfaces.nauvis.calculate_tile_properties({ propName }, chunkPositions)
    if not calcResults then error("No noise results!") end

    local noiseVals = calcResults[propName]
    if not noiseVals then error("No noise results! for "..propName) end
    if table_size(noiseVals) < 100 then error("table_size(noiseVals) < 100 "..table_size(noiseVals)) end
    if type(noiseVals[1]) ~= "number" then error("type(noiseVals[1]) ~= number") end

    local noiseX={}
    local noiseY={}
    for i=1,#noiseVals do
        noiseX[i] = chunkPositions[i].x
        noiseY[i] = chunkPositions[i].y
    end

    if noiseVals == nil then error("noiseVals == nil") end
    if noiseVals[1] == nil then error("noiseVals[1] == nil") end
    if type(noiseVals[1]) ~= "number" then error("type(noiseVals[1]) ~= number") end

    if noiseX == nil then error("noiseX == nil") end
    if noiseX[1] == nil then error("noiseX[1] == nil") end
    if type(noiseX[1]) ~= "number" then error("type(noiseX[1]) ~= number") end

    return noiseVals, noiseX, noiseY
end

-- Normalize to [0-1] scale
function routines.normalize(noiseVal, noiseX, noiseY)
    for index,val in ipairs(noiseVal) do
        noiseVal[index] = math.min(val, constants.TOP_ELEVATION) / constants.TOP_ELEVATION
    end

    return noiseVal, noiseX, noiseY
end

return routines
