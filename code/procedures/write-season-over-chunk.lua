local evalNewTerrainTiles = require "code/functions-lib/terrain/terrain-new-tiles"
local biomes = require "code/persistence/biomes"
local saveChunkBiomes = require "code/procedures/save-chunk-biomes"

return function(time, chunk)
    if chunk == nil then error("chunk == nil") end
    if chunk.x == nil then error("chunk.x == nil") end

    local cacheIndex = biomes.indexOfAChunk(time.currentStepOfAMonth, chunk)
    if (cacheIndex == biomes.CHUNK_NOT_FOUND) then
        --- Chunk to be season-processed is not found in cache
        game.print("Chunk to be season-processed is not found in cache "..chunk.x.." "..chunk.y)
        saveChunkBiomes(chunk)
    end
    cacheIndex = biomes.indexOfAChunk(time.currentStepOfAMonth, chunk)

    if (cacheIndex == biomes.CHUNK_NOT_FOUND) then
        error("Still not found####!!!!") -- TODO ARGHH!
    end

    local newTiles = evalNewTerrainTiles(time, chunk)

    game.surfaces.nauvis.set_tiles(newTiles)
end
