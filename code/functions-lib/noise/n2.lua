local n2 = {}

local routines = require "code/functions-lib/noise/common-routines"
local cache = require "code/persistence/cache"

local DOMAIN = "n2"

local generator =
    function(chunk)
        return routines.generateRaw(chunk, DOMAIN)
    end

function n2.getByChunk(chunk)
    return cache.getByChunk(DOMAIN, generator, chunk)
end

function n2.getByPos(pos)
    return cache.getByPos(DOMAIN, generator, pos)
end

return n2
