time = require "code/functions-lib/time/time"
require "noise"
normalize = require "code/noise/normalize"
filterPositionsByNoise = require "code/noise/pos-filter-min-max"
logNoise = require "code/noise/debug"

function printTime()
    game.print(game.ticks_played ..
            " month:" .. time.months.current() ..
            " leftPart:" .. time.months.leftPart() ..
            " rightPart:" .. time.months.rightPart())
end

-- @time - dependency routines
return function()
    for chunk in game.surfaces.nauvis.get_chunks() do
        if chunk.x == 0 and chunk.y == 0 then
            local noiseToPos = normalize(noise.eval(chunk))

            local positionsToModify = filterPositionsByNoise(
                    noiseToPos,
                    time.months.leftPart(),
                    time.months.rightPart()
            )

            local isCooling = time.months.current() % 2 == 0
            if (isCooling) then
                game.print("cooling " .. #positionsToModify)
                --local positionsToFreeze =
            else
                game.print("warming" .. #positionsToModify)
            end

            printTime()
            game.print("---")
        end
    end
end
