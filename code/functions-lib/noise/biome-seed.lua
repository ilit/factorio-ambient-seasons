local biomeSeed = {}

local biomeSeedGenerator = require "code/functions-lib/noise/biome-seed-generator"
local cache = require "code/persistence/chunk-cache"

local DOMAIN = "biome-seed"

-- TODO Move from Noise
local generator =
    function(chunk)
        local noiseVals = {}
        local noiseX = {}
        local noiseY = {}
        for x = chunk.area.left_top.x, chunk.area.right_bottom.x
        do
            for y = chunk.area.left_top.y, chunk.area.right_bottom.y
            do
                noiseVals[#noiseVals+1] = biomeSeedGenerator({x=x,y=y})
                noiseX[#noiseX+1] = x
                noiseY[#noiseY+1] = y
            end
        end

        return noiseVals, noiseX, noiseY
    end

function biomeSeed.getByChunk(chunk)
    return cache.getByChunk(DOMAIN, generator, chunk)
end

function biomeSeed.getByPos(pos)
    return cache.getByPos(DOMAIN, generator, pos)
end

return biomeSeed
