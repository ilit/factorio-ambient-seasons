local elevation = require "code/functions-lib/noise/elevation"
local aux = require "code/functions-lib/noise/aux"
local biomeSeed = require "code/functions-lib/noise/biome-seed"

return function(surface, chunkPos)
    for chunkIter in surface.get_chunks() do
        if (chunkIter.x == chunkPos.x and
            chunkIter.y == chunkPos.y) then
            elevation.getByChunk(chunkIter)
            aux.getByChunk(chunkIter)
            biomeSeed.getByChunk(chunkIter)
        end
    end
end
