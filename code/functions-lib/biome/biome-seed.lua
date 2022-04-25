local biomeSeed = {}

local biomeSeedGenerator = require "code/functions-lib/biome/biome-seed-generator"
local cache = require "code/persistence/chunk-cache"

local DOMAIN = "biomeSeed"

local generator =
    function(chunk)
        local noiseVals = {}
        local noiseX = {}
        local noiseY = {}
        for x = chunk.area.left_top.x, chunk.area.right_bottom.x
        do
            for y = chunk.area.left_top.y, chunk.area.right_bottom.y
            do
                local seed = biomeSeedGenerator({x=x,y=y})
                if type(seed) ~= "number" then error("type(seed) ~= number is "..seed) end

                noiseVals[#noiseVals+1] = seed
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
