local getOriginalSurface = require "code/persistence/original-surface-get"

return function(x, y)
    local oSurf = getOriginalSurface()
    local tile = oSurf.get_tile(x, y)
    return tile
end
