local elevation = {}

local routines = require "code/functions-lib/noise/common-routines"
local cache = require "code/persistence/cache"

local DOMAIN = "elevation"

local generator =
    function(chunk)
        if chunk == nil then error("chunk is nil") end
        return routines.normalize(routines.generateRaw(chunk, DOMAIN))
    end

function elevation.getByChunk(chunk)
    return cache.getByChunk(DOMAIN, generator, chunk)
end

function elevation.getByPos(pos)
    return cache.getByPos(DOMAIN, generator, pos)
end

return elevation
