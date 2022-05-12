local biomeSaveCell = require "code/procedures/biomes-save-cell"
local biomeSaveChunk = require "code/procedures/biomes-save-chunk-index"
local biomeCacheRead = require "code/functions-lib/biome/biome-cache-read"
local purgeBiomes = require "test/util/biomes-purge"
local constants = require "code/constants"

local biomeCacheReadTest = {}

function biomeCacheReadTest:setup()
    purgeBiomes()
end

function biomeCacheReadTest:testTwoChunks()
    local step = 3
    local chunk1 = {x=20,y=30}
    local chunk2 = {x=40,y=50}
    biomeSaveCell(1,2,step,1212)
    biomeSaveChunk(step, chunk1)
    biomeSaveCell(1,3,step,1313)
    biomeSaveCell(1,4,step,1414)

    biomeSaveCell(1,222,step,1515)
    biomeSaveChunk(step, chunk2)
    biomeSaveCell(2,222,step,1616)
    biomeSaveCell(3,222,step,1717)

    assertEquals(biomeCacheRead.indexOfAChunk(step, chunk1), 1)
    assertEquals(biomeCacheRead.indexOfAChunk(step, chunk2), 4)

    --- Everything should be found starting from index of chunk1
    assertEquals(biomeCacheRead.getNumberForStepAndCell(step, 1, 2,chunk1), 1212)
    assertEquals(biomeCacheRead.getNumberForStepAndCell(step, 1, 4,chunk1), 1414)
    assertEquals(biomeCacheRead.getNumberForStepAndCell(step, 3, 222,chunk1), 1717)

    --- Only latest cells should be found starting from index of chunk2
    assertEquals(biomeCacheRead.getNumberForStepAndCell(step, 1, 2,chunk2), constants.UNDEFINED_BIOME)
    assertEquals(biomeCacheRead.getNumberForStepAndCell(step, 1, 4,chunk2), constants.UNDEFINED_BIOME)
    assertEquals(biomeCacheRead.getNumberForStepAndCell(step, 3, 222,chunk2), 1717)
end

function biomeCacheReadTest:testChunkNotFound()
    local step = 3
    local chunk1 = {x=20,y=30}
    local chunk2 = {x=40,y=50}
    biomeSaveCell(1,2,step,1212)
    biomeSaveChunk(step, chunk1)

    assertEquals(biomeCacheRead.indexOfAChunk(step, chunk1), 1)
    assertEquals(biomeCacheRead.indexOfAChunk(step, chunk2), constants.CHUNK_NOT_FOUND)
end

return biomeCacheReadTest
