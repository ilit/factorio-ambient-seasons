elevation = {}

local routines = {}
local cache = {}

function elevation.set_common_routines(routinesArg)
    routines = routinesArg
end

function elevation.get(chunk)
    local key = chunk.x .. "/" .. chunk.y
    if cache[key] == nil then
        game.print("Cache for " .. key .. " is empty. Generating.")
        local generatedNoise = noise.normalize(noise.generateRaw(chunk))
        cache[key] = generatedNoise
    end

    return cache[key]
end

return elevation
