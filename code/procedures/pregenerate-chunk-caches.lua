local elevation = require "code/functions-lib/noise/elevation"
local aux = require "code/functions-lib/noise/aux"

return function(surface, chunkPos)
    for chunkIter in surface.get_chunks() do
        if (chunkIter.x == chunkPos.x and
            chunkIter.y == chunkPos.y) then
            elevation.getByChunk(chunkIter)
            aux.getByChunk(chunkIter)
            -- TODO More caches
        end
    end
end
