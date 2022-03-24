local elevation = {}

local routines = require "code/functions-lib/noise/common-routines"

elevationCache = {}
elevationCacheSize = 0

function elevation.get(chunk)
    local key = chunk.x .. "_" .. chunk.y
    if not elevationCache[key] then
        --game.print("Cache for " .. key .. " is empty. Generating.")
        local generatedNoise = routines.normalize(routines.generateRaw(chunk))
        elevationCache[key] = generatedNoise
        elevationCacheSize = elevationCacheSize + 1
    else
        --game.print("Cache for " .. key .. " FOUND.")
    end

    --game.print("Cache size " .. elevationCacheSize .. " " .. game.ticks_played)
    return elevationCache[key]
end

return elevation
