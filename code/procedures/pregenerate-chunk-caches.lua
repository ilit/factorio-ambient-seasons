local elevation = require "code/functions-lib/noise/elevation"

return function(surface, chunkPos)
    for chunkIter in surface.get_chunks() do
        if (chunkIter.x == chunkPos.x and
            chunkIter.y == chunkPos.y) then
            elevation.get(chunkIter)
        end
    end
end
