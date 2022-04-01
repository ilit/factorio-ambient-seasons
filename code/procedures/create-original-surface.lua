local constants = require "code/constants"

return function()
    local settings = game.get_surface("nauvis").map_gen_settings

    --game.print(serpent.block(game.get_surface("nauvis").map_gen_settings.cliff_settings))

    --log("################")
    --log(serpent.block(settings))
    --error("log(serpent.block(settings))")

    -- Reset cliffs
    settings.cliff_settings.size = 0
    settings.autoplace_controls.trees.size = 0
    settings.autoplace_controls["enemy-base"].size = 0
    -- TODO Vegetaion setting in AB project will not help. It is mod scal not surface scale?
    -- Can touch only map_gen_settings?
    -- TODO Remove entities on generation

    return game.create_surface(constants.ORIGINAL_SURFACE, settings)
end
