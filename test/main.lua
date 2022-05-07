EXPORT_ASSERT_TO_GLOBALS = true
luaunit = require('test/luaunit')

TestAdd = require("test/elevation-to-step-test")

os.exit( luaunit.LuaUnit.run("-v") )