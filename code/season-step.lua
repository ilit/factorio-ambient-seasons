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

-- @time - dependency routines
return function(time)
    --game.print(stepIndex .. " @time " .. evalTime())

    for chunk in game.surfaces.nauvis.get_chunks() do
        local noiseToPos = normalize(noise.eval(chunk))



        game.print(game.ticks_played ..
                " m:" .. time.months.current() ..
                " step:" .. time.steps.played())
    end
end
