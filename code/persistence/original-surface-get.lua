local constants = require "code/constants"
local createOrigSurface = require "code/procedures/create-original-surface"

return function()
    local origSurface = game.get_surface(constants.ORIGINAL_SURFACE)

    if origSurface == nil then
        origSurface = createOrigSurface()
    end

    return origSurface
end

