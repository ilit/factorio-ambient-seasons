local elevation = {}

local routines = require "code/functions-lib/noise/common-routines"

if elevationCache == nil then elevationCache = {} end

function elevation.get(chunk)
    local key = chunk.x .. "/" .. chunk.y
    if elevationCache[key] == nil then
        game.print("Cache for " .. key .. " is empty. Generating.")
        local generatedNoise = routines.normalize(
                routines.generateRaw(chunk))
        elevationCache[key] = generatedNoise
    end

    return elevationCache[key]
end

return elevation
