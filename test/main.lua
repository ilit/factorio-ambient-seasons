EXPORT_ASSERT_TO_GLOBALS = true
luaunit = require('test/luaunit')

--- Smaller tests
TestElevationToStep = require("test/elevation-to-step-test")
TestChunkPositionsTwoArrays = require("test/chunk-to-positions-xs-xy-test")
TestChunkPositionsFactorio = require("test/chunk-to-positions-factorio-test")
TestBiomeSaveCell = require("test/biome-save-cell-test")

--- Bigger tests

os.exit( luaunit.LuaUnit.run("-v") )