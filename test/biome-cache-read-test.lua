local biomeSaveCell = require "code/procedures/biomes-save-cell"
local biomeSaveChunk = require "code/procedures/biomes-save-chunk-index"
local purgeBiomes = require "test/util/biomes-purge"

local biomeCacheReadTest = {}
local BIOME = -123;

function biomeCacheReadTest:setup()
    purgeBiomes()
end

local function size(t)
    local count = 0
    for k,v in pairs(t) do
        count = count + 1
    end
    return count
end

function biomeCacheReadTest:testSingleInsertion()
    assertEquals(size(biomes), 0)
    --- (x, y, step, biome)
    local step = 3
    local chunk = {x=20,y=30}
    biomeSaveCell(1,2,step,BIOME)
    biomeSaveChunk(step, chunk)
    assertEquals(size(biomes), 1)
    assertEquals(biomes[step]["chxs"], {20})
    assertEquals(biomes[step]["chys"], {30})
    assertEquals(biomes[step]["index"], {1})
end

function biomeCacheReadTest:testIndexShouldNotUpdateOnMoreCellInsertions()
    assertEquals(size(biomes), 0)
    --- (x, y, step, biome)
    local step = 3
    local chunk = {x=20,y=30}
    biomeSaveCell(1,2,step,BIOME)
    biomeSaveChunk(step, chunk)
    assertEquals(size(biomes), 1)
    assertEquals(biomes[step]["chxs"], {20})
    assertEquals(biomes[step]["chys"], {30})
    assertEquals(biomes[step]["index"], {1})
    biomeSaveCell(1,3,step,BIOME)
    assertEquals(size(biomes), 1)
    assertEquals(biomes[step]["chxs"], {20})
    assertEquals(biomes[step]["chys"], {30})
    assertEquals(biomes[step]["index"], {1})
end

function biomeCacheReadTest:testTwoChunks()
    assertEquals(size(biomes), 0)
    --- (x, y, step, biome)
    local step = 3
    local chunk1 = {x=20,y=30}
    local chunk2 = {x=40,y=50}

    --- Chunk 1
    biomeSaveCell(1,2,step,BIOME)
    biomeSaveChunk(step, chunk1)
    biomeSaveCell(1,3,step,BIOME)
    biomeSaveChunk(step, chunk1)

    --- Chunk 2
    biomeSaveCell(1,4,step,BIOME)
    biomeSaveChunk(step, chunk2)
    biomeSaveCell(1,5,step,BIOME)
    biomeSaveChunk(step, chunk2)

    assertEquals(size(biomes), 1) --- Single step
    assertEquals(#biomes[step]["chxs"], 2) --- Two Indices
    assertEquals(biomes[step]["index"][1], 1) --- Chunk 1 points to index 1
    assertEquals(biomes[step]["index"][2], 3) --- Chunk 1 points to index 3
end

return biomeCacheReadTest
