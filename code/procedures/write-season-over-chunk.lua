local elevation = require "code/functions-lib/noise/elevation"
local filterPositionsByNoise = require "code/functions-lib/noise/pos-filter-min-max"
local evalNewTerrainTiles = require "code/functions-lib/terrain/terrain-new-tiles"

return function(time, chunk)
    local elevationsToPos = elevation.getByChunk(chunk)

    local positionsToModify = filterPositionsByNoise(
            elevationsToPos,
            time.monthLeftRelPart,
            time.monthRightRelPart
    )

    local newTiles = evalNewTerrainTiles(time, positionsToModify)

    game.surfaces.nauvis.set_tiles(newTiles)
end
