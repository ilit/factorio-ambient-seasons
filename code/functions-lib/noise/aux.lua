local aux = {}

local routines = require "code/functions-lib/noise/common-routines"
local cache = require "code/persistence/cache"

local DOMAIN = "aux"

local generator =
    function(chunk)
        return routines.generateRaw(chunk, DOMAIN)
    end

function aux.getByChunk(chunk)
    return cache.getByChunk(DOMAIN, generator, chunk)
end

function aux.getByPos(pos)
    return cache.getByPos(DOMAIN, generator, pos)
end

return aux
