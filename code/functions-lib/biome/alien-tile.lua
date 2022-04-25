local biomeSeed = require "code/functions-lib/biome/biome-seed"

return function(worldTilePos)
    return biomeSeed.getByPos(worldTilePos)
end
