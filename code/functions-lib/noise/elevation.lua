local elevation = {}

local routines = require "code/functions-lib/noise/common-routines"
local cache = require "code/persistence/cache"

local DOMAIN = "elevation"

local generator =
    function(chunk)
        if chunk == nil then error("chunk is nil") end
        local noiseVal, noiseX, noiseY = routines.generateRaw(chunk, DOMAIN)

        if noiseVal == nil then error("elevNoiseVals == nil") end
        if noiseX == nil then error("noiseX == nil") end

        return routines.normalize(noiseVal, noiseX, noiseY)
    end

function elevation.getByChunk(chunk)
    local noiseVal, noiseX, noiseY = cache.getByChunk(DOMAIN, generator, chunk)

    if noiseVal == nil then error("elevNoiseVals == nil") end
    if noiseX == nil then error("noiseX == nil") end

    return noiseVal, noiseX, noiseY
end

function elevation.getByPos(pos)
    return cache.getByPos(DOMAIN, generator, pos)
end

return elevation
