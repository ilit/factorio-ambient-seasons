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

-- Filter positions by noise
function filterPositionsByNoise(valsToPos, min, max)
    local ret = {}
    for i, triplet in ipairs(valsToPos) do
        local noise = triplet[1]
        local x = triplet[2]
        local y = triplet[3]

        if min <= noise and noise < max then
            ret[#ret +1] = { x, y }
        end
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
            " leftPart:" .. time.months.leftPart() ..
            " rightPart:" .. time.months.rightPart())
end

-- @time - dependency routines
return function(time)
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

            printTime(time)
            game.print("---")
        end
    end
end
