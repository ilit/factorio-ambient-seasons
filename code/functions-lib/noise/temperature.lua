local temperature = {}

local routines = require "code/functions-lib/noise/common-routines"
local cache = require "code/persistence/cache"

function temperature.get(chunk)
    if chunk.x == nil then error("chunk is nil") end

    local key = chunk.x .. "_" .. chunk.y
    if not cache.temperature[key] then
        local generatedNoise = routines.normalize(routines.generateRaw(chunk))
        cache.temperature[key] = generatedNoise
    end

    return cache.temperature[key]
end

return temperature
