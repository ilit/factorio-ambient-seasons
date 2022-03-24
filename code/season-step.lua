time = require "code/functions-lib/time/time"
local noise = require "code/functions-lib/noise/noise"
local filterPositionsByNoise = require "code/functions-lib/noise/pos-filter-min-max"
local terrain = require "code/procedures-lib/terrain/terrain"
local printStepDebugData = require "code/debug/print-step-debug-data.lua"

return function()
    for chunk in game.surfaces.nauvis.get_chunks() do
        local noiseToPos = noise.elevation.get(chunk)

        local positionsToModify = filterPositionsByNoise(
                                    noiseToPos,
                                    time.months.leftPart(),
                                    time.months.rightPart()
                                  )

        local newTiles = terrain.newTiles(positionsToModify)
        game.surfaces.nauvis.set_tiles(newTiles)
        --flora.update()

        printStepDebugData()
    end
end
