local constants = require "code/constants"
local floor = math.floor

return function(pos)
    --- Eval current Voronoi frame
    local currVorFrameX = floor(pos.x / constants.VORONOI_FRAME_SIZE)
    local currVorFrameY = floor(pos.y / constants.VORONOI_FRAME_SIZE)

    return { x = currVorFrameX, y = currVorFrameY }
end