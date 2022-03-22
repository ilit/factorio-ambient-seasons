require "noise"

-- Normalize to [0-1] scale
function normalize(rawNoiseValsToPos)
    local TOP_ELEVATION = 27

    local ret = {}
    for i, triplet in ipairs(rawNoiseValsToPos) do
        local rawNoise = triplet[1]
        local capped = math.min(rawNoise, TOP_ELEVATION)
        local normalized = capped / TOP_ELEVATION

        local x = triplet[2]
        local y = triplet[3]

        ret[#ret +1] =
            { normalized, x, y }
    end

    return ret
end

function logNoise(valsToPos)
    for i, triplet in ipairs(valsToPos) do
        local noise = triplet[1]
        local x = triplet[2]
        local y = triplet[3]

        log(x .." ".. y .." ".. noise)
    end
end

function printTime(time)
    game.print(game.ticks_played ..
            " month:" .. time.months.current() ..
            " part:" .. time.months.passedPart())
end

-- @time - dependency routines
return function(time)
    for chunk in game.surfaces.nauvis.get_chunks() do
        local noiseToPos = normalize(noise.eval(chunk))

        local isCooling = time.months.current() % 2 == 0

        if (isCooling) then
            game.print("cooling")
            --local positionsToFreeze =
        else
            game.print("warming")
        end

        printTime(time)
    end
end
