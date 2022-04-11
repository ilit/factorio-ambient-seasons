local elevation = require "code/functions-lib/noise/elevation"
local filterPositionsByNoise = require "code/functions-lib/noise/pos-filter-min-max"
local evalNewTerrainTiles = require "code/functions-lib/terrain/terrain-new-tiles"

return function(time, chunk)
    if chunk == nil then error("chunk == nil") end
    if chunk.x == nil then error("chunk.x == nil") end

    local elevationsToPos = elevation.getByChunk(chunk)
    if elevationsToPos == nil then error("elevationsToPos == nil") end

    local positionsToModify = filterPositionsByNoise(
            elevationsToPos,
            time.monthLeftRelPart,
            time.monthRightRelPart
    )

    local newTiles = evalNewTerrainTiles(time, positionsToModify)

    game.surfaces.nauvis.set_tiles(newTiles)
end
