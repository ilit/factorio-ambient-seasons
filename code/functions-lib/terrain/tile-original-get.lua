local constants = require "code/constants"

local originalSurface = function()
    return game.surfaces[constants.ORIGINAL_SURFACE]
end

local tryRegisterOriginalSurface = function()
    if not originalSurface then
        local settings = game.surfaces.nauvi.map_gen_settings
        game.create_surface(constants.ORIGINAL_SURFACE, settings)
    end
end

return function(x, y)
    tryRegisterOriginalSurface()
    return originalSurface().get_tile(x, y).prototype.name
end
