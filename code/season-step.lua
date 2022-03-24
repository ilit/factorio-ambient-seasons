time = require "code/functions-lib/time/time"
noise = require "code/functions-lib/noise/noise"
filterPositionsByNoise = require "code/functions-lib/noise/pos-filter-min-max"

terrain = require "code/procedures-lib/terrain/terrain"

printStepDebugData = require "code/debug/print-step-debug-data.lua"

return function()
    for chunk in game.surfaces.nauvis.get_chunks() do
        if chunk.x > -6 and chunk.y > -6 and chunk.x < 6 and chunk.y < 6 then
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
end
