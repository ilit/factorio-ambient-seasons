local biomeSaveCell = require "code/procedures/biomes-save-cell"
local purgeBiomes = require "test/util/biomes-purge"

local biomeSaveCellTest = {}

function biomeSaveCellTest:setup()
    purgeBiomes()
end

local function size(t)
    local count = 0
    for k,v in pairs(t) do
        count = count + 1
    end
    return count
end

function biomeSaveCellTest:testSingleInsertion()
    assertEquals(size(biomes), 0)
    --- (x, y, step, biome)
    biomeSaveCell(1,2,3,4)
    assertEquals(size(biomes), 1)
    assertEquals(biomes, {[3]={biomes={4}, xs={1}, ys={2}}})
end

function biomeSaveCellTest:testTwoDifferentSteps()
    assertEquals(size(biomes), 0)
    --- (x, y, step, biome)
    biomeSaveCell(1,2,3,4)
    biomeSaveCell(5,6,7,8)
    assertEquals(size(biomes), 2)
    assertEquals(biomes, {[3]={biomes={4}, xs={1}, ys={2}}, [7]={biomes={8}, xs={5}, ys={6}}})
end

function biomeSaveCellTest:testDeniIdenticalPositions()
    assertEquals(size(biomes), 0)
    --- (x, y, step, biome)
    biomeSaveCell(1,2,3,4)
    local secondInsert = function() endbiomeSaveCell(1,2,3,8) end
    assertError(secondInsert)
end

function biomeSaveCellTest:testTwoPositionsForOneStep()
    assertEquals(size(biomes), 0)
    --- (x, y, step, biome)
    biomeSaveCell(1,2,3,4)
    biomeSaveCell(1,3,3,8)
    assertEquals(size(biomes), 1)
    assertEquals(biomes, {[3]={biomes={4, 8}, xs={1, 1}, ys={2, 3}}})
end

return biomeSaveCellTest
