local biomesSaveCell = require "code/procedures/biomes-save-cell"
local purgeBiomes = require "test/util/biomes-purge"
local size = require "test/util/table-size"

local biomeSaveCellTest = {}

function biomeSaveCellTest:setup()
    purgeBiomes()
end

function biomeSaveCellTest:testSingleInsertion()
    assertEquals(size(biomes), 0)
    --- (x, y, step, biome)
    biomesSaveCell(1,2,3,4)
    assertEquals(size(biomes), 1)
    assertEquals(biomes, {[3]={biomes={4}, xs={1}, ys={2}}})
end

function biomeSaveCellTest:testTwoDifferentSteps()
    assertEquals(size(biomes), 0)
    --- (x, y, step, biome)
    biomesSaveCell(1,2,3,4)
    biomesSaveCell(5,6,7,8)
    assertEquals(size(biomes), 2)
    assertEquals(biomes, {[3]={biomes={4}, xs={1}, ys={2}}, [7]={biomes={8}, xs={5}, ys={6}}})
end

function biomeSaveCellTest:testDeniIdenticalPositions()
    assertEquals(size(biomes), 0)
    --- (x, y, step, biome)
    biomesSaveCell(1,2,3,4)
    local secondInsert = function() endbiomeSaveCell(1,2,3,8) end
    assertError(secondInsert)
end

function biomeSaveCellTest:testDeniNegativeStep()
    assertEquals(size(biomes), 0)
    --- (x, y, step, biome)
    local ins = function() biomesSaveCell(1,2,-3,8) end
    assertErrorMsgContains("step < 1", ins)
end

function biomeSaveCellTest:testTwoPositionsForOneStep()
    assertEquals(size(biomes), 0)
    --- (x, y, step, biome)
    biomesSaveCell(1,2,3,4)
    biomesSaveCell(1,3,3,8)
    assertEquals(size(biomes), 1)
    assertEquals(biomes, {[3]={biomes={4, 8}, xs={1, 1}, ys={2, 3}}})
end

function biomeSaveCellTest:testManyInsertions()
    assertEquals(size(biomes), 0)
    --- (x, y, step, biome)
    local BIOME = 0
    biomesSaveCell(1,2,11,BIOME)
    biomesSaveCell(1,3,11,BIOME)
    biomesSaveCell(1,4,11,BIOME)

    biomesSaveCell(1,5,22,BIOME)
    biomesSaveCell(1,6,22,BIOME)
    biomesSaveCell(1,7,22,BIOME)

    biomesSaveCell(1,8,11,BIOME)
    biomesSaveCell(1,9,11,BIOME)
    biomesSaveCell(1,10,11,BIOME)

    biomesSaveCell(1,11,22,BIOME)
    biomesSaveCell(1,12,22,BIOME)
    biomesSaveCell(1,13,22,BIOME)

    assertEquals(size(biomes), 2)
    assertEquals(biomes,
    {
        [11]={biomes={0, 0, 0, 0, 0, 0}, xs={1, 1, 1, 1, 1, 1}, ys={2, 3, 4, 8, 9, 10}},
        [22]={biomes={0, 0, 0, 0, 0, 0}, xs={1, 1, 1, 1, 1, 1}, ys={5, 6, 7, 11, 12, 13}}
    })
end

return biomeSaveCellTest
