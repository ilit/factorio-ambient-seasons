local elevation = {}

local routines = require "code/functions-lib/noise/common-routines"
local cache = require "code/persistence/cache"

-- TODO to f()
function elevation.get(chunk)
    if chunk.x == nil then error("chunk is nil") end

    local key = chunk.x .. "_" .. chunk.y
    if not cache.elevation[key] then
        local generatedNoise = routines.normalize(routines.generateRaw(chunk))
        cache.elevation[key] = generatedNoise
    end

    return cache.elevation[key]
end

return elevation
