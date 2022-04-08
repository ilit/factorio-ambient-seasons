local elevation = require "code/functions-lib/noise/elevation"
local filterPositionsByNoise = require "code/functions-lib/noise/pos-filter-min-max"
local evalNewTerrainTiles = require "code/functions-lib/terrain/terrain-new-tiles"

return function(time, chunk)
    local noiseToPos = elevation.get(chunk)

    local positionsToModify = filterPositionsByNoise(
            noiseToPos,
            time.monthLeftRelPart,
            time.monthRightRelPart
    )

    local newTiles = evalNewTerrainTiles(time, positionsToModify)
    --for i, pos in ipairs(positionsToModify) do
    --    local tile = game.surfaces.nauvis.get_tile(pos.x, pos.y)
    --end

    game.surfaces.nauvis.set_tiles(newTiles)
end
