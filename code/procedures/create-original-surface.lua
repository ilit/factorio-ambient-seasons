local constants = require "code/constants"

return function()
    local surface = game.create_surface(constants.ORIGINAL_SURFACE, nil)
    surface.generate_with_lab_tiles = true
    return game.create_surface(constants.ORIGINAL_SURFACE, settings)
end
