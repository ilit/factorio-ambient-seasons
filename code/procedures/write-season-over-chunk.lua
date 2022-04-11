local elevation = require "code/functions-lib/noise/elevation"
local filterPositionsByNoise = require "code/functions-lib/noise/pos-filter-min-max"
local evalNewTerrainTiles = require "code/functions-lib/terrain/terrain-new-tiles"

return function(time, chunk)
    if chunk == nil then error("chunk == nil") end
    if chunk.x == nil then error("chunk.x == nil") end

    local elevNoiseVals, noiseX, noiseY = elevation.getByChunk(chunk)
    if elevNoiseVals == nil then error("elevNoiseVals == nil") end
    if noiseX == nil then error("noiseX == nil") end

    local fnoiseX, fnoiseY = filterPositionsByNoise(
            elevNoiseVals, noiseX, noiseY,
            time.monthLeftRelPart,
            time.monthRightRelPart
    )

    local newTiles = evalNewTerrainTiles(time, fnoiseX, fnoiseY)

    game.surfaces.nauvis.set_tiles(newTiles)
end
