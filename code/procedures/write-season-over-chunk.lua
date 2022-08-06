local evalNewTerrainTiles = require "code/functions-lib/terrain/terrain-new-tiles"
local biomeCacheRead = require "code/functions-lib/biome/biome-cache-read"
local getSurface = require "external/surface"
local constants = require "code/constants"

return function(time, chunk)
    if chunk == nil then error("chunk == nil") end
    if chunk.x == nil then error("chunk.x == nil") end

    local step = time.currentStepOfAMonth
    local cacheIndex = biomeCacheRead.indexOfAChunk(step, chunk)

    if (cacheIndex ~= constants.CHUNK_NOT_FOUND) then
        local newTiles = evalNewTerrainTiles(time, chunk)
        getSurface().set_tiles(newTiles)
    end
end
