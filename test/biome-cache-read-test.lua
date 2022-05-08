local biomeSaveCell = require "code/procedures/biomes-save-cell"
local biomeSaveChunk = require "code/procedures/biomes-save-chunk-index"
local biomeCacheRead = require "code/functions-lib/biome/biome-cache-read"
local purgeBiomes = require "test/util/biomes-purge"

local biomeCacheReadTest = {}
local BIOME = -123;

function biomeCacheReadTest:setup()
    purgeBiomes()
end

function biomeCacheReadTest:testSingleInsertion()
    local step = 3
    local chunk1 = {x=20,y=30}
    local chunk2 = {x=40,y=50}
    biomeSaveCell(1,2,step,BIOME)
    biomeSaveChunk(step, chunk1)
    biomeSaveCell(1,3,step,BIOME)
    biomeSaveCell(1,4,step,BIOME)

    biomeSaveCell(1,222,step,BIOME)
    biomeSaveChunk(step, chunk2)
    biomeSaveCell(2,222,step,BIOME)
    biomeSaveCell(3,222,step,BIOME)

    assertEquals(biomeCacheRead.indexOfAChunk(step, chunk1), 1)
    assertEquals(biomeCacheRead.indexOfAChunk(step, chunk2), 4)
end

return biomeCacheReadTest
