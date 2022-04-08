local elevation = {}

local routines = require "code/functions-lib/noise/common-routines"
local cache = require "code/persistence/cache"

function elevation.getByChunk(chunk)
    if chunk.x == nil then error("chunk is nil") end

    local key = chunk.x .. "_" .. chunk.y
    if not cache.elevation[key] then
        local PROP_NAME = "elevation"
        local generatedNoise = routines.normalize(routines.generateRaw(chunk, PROP_NAME))
        cache.elevation[key] = generatedNoise
    end

    return cache.elevation[key]
end

return elevation
