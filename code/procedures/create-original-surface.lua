local constants = require "code/constants"

return function()
    local settings = game.get_surface("nauvis").map_gen_settings
    -- TODO disable trees.
    -- TODO disable rocks.
    -- TODO disable deco.
    -- TODO disable enemies.
    -- TODO disable neutral-fish.
    -- TODO disable ores.
    -- TODO disable cliffs.
    --settings.autoplace_controls
    --settings.cliff_settings
    game.print("creating surface")
    return game.create_surface(constants.ORIGINAL_SURFACE, settings)
end
