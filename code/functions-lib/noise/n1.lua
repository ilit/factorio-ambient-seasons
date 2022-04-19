local n1 = {}

local routines = require "code/functions-lib/noise/common-routines"
local cache = require "code/persistence/cache"

local DOMAIN = "n1"

local generator =
    function(chunk)
        return routines.generateRaw(chunk, DOMAIN)
    end

function n1.getByChunk(chunk)
    return cache.getByChunk(DOMAIN, generator, chunk)
end

function n1.getByPos(pos)
    return cache.getByPos(DOMAIN, generator, pos)
end

return n1
