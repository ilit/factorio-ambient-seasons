time = require "code/functions-lib/time/time"
noise = require "code/functions-lib/noise/noise"
filterPositionsByNoise = require "code/functions-lib/noise/pos-filter-min-max"

terrain = require "code/procedures-lib/terrain/terrain"

printStepDebugData = require "code/debug/print-step-debug-data.lua"

return function()
    for chunk in game.surfaces.nauvis.get_chunks() do
        if chunk.x > 0 and chunk.y > 0 and chunk.x < 9 and chunk.y < 9 then
            local noiseToPos = noise.normalize(noise.generateRaw(chunk))

            local positionsToModify = filterPositionsByNoise(
                                        noiseToPos,
                                        time.months.leftPart(),
                                        time.months.rightPart()
                                      )

            for i, pos in ipairs(positionsToModify) do
                terrain.updatePos(pos)
                --flora.update()
            end

            printStepDebugData()
        end
    end
end
