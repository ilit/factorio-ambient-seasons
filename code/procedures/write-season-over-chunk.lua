local evalNewTerrainTiles = require "code/functions-lib/terrain/terrain-new-tiles"
local biomeCacheRead = require "code/functions-lib/biome/biome-cache-read"
local saveChunkBiomes = require "code/procedures/save-chunk-biomes"
local getSurface = require "external/surface"
local constants = require "code/constants"

return function(time, chunk)
    if chunk == nil then error("chunk == nil") end
    if chunk.x == nil then error("chunk.x == nil") end

    local cacheIndex = biomeCacheRead.indexOfAChunk(time.currentStepOfAMonth, chunk)
    if (cacheIndex == constants.CHUNK_NOT_FOUND) then
        --- Chunk to be season-processed is not found in cache
        game.print("Chunk to be season-processed is not found in cache "..chunk.x.." "..chunk.y)
        saveChunkBiomes(chunk)
    end
    cacheIndex = biomeCacheRead.indexOfAChunk(time.currentStepOfAMonth, chunk)

    if (cacheIndex == constants.CHUNK_NOT_FOUND) then
        error("Still not found####!!!!") -- TODO ARGHH!
    end

    local newTiles = evalNewTerrainTiles(time, chunk)

    getSurface().set_tiles(newTiles)
end
