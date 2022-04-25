local elevation = {}

local routines = require "code/functions-lib/noise/common-routines"
local cache = require "code/persistence/chunk-cache"

local DOMAIN = "elevation"

local generator =
    function(chunk)
        if chunk == nil then error("chunk is nil") end
        local noiseVal, noiseX, noiseY = routines.generateRaw(chunk, DOMAIN)

        return routines.normalize(noiseVal, noiseX, noiseY)
    end

function elevation.getByChunk(chunk)
    return cache.getByChunk(DOMAIN, generator, chunk)
end

function elevation.getByPos(pos)
    return cache.getByPos(DOMAIN, generator, pos)
end

return elevation
