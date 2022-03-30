local elevation = require "code/functions-lib/noise/elevation"
local filterPositionsByNoise = require "code/functions-lib/noise/pos-filter-min-max"
local terrain = require "code/functions-lib/terrain/terrain"
local printStepDebugData = require "code/debug/print-step-debug-data.lua"
time = require "code/functions-lib/time/time"

return function(chunk)
    local noiseToPos = elevation.get(chunk)

    local positionsToModify = filterPositionsByNoise(
            noiseToPos,
            time.months.leftPart(),
            time.months.rightPart()
    )

    local newTiles = terrain.newTiles(positionsToModify)
    for i, pos in ipairs(positionsToModify) do
        local tile = game.surfaces.nauvis.get_tile(pos.x, pos.y)
    end

    game.surfaces.nauvis.set_tiles(newTiles)
    -- TODO flora.update()

    printStepDebugData()
end
