EXPORT_ASSERT_TO_GLOBALS = true
luaunit = require('test/luaunit')

TestElevationToStep = require("test/elevation-to-step-test")
TestChunkPositionsTwoArrays = require("test/chunk-to-positions-xs-xy-test")

os.exit( luaunit.LuaUnit.run("-v") )