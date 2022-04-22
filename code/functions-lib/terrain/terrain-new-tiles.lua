local aux = require "code/functions-lib/noise/aux"
local alienBiomeTilename_get = require "code/functions-lib/noise/alien-biome-get"

return function (time, xs, ys)
    local tiles = {}
    local season = time.currentMonth % 2 + 1

    for i = 1, #xs do
        local newTileName = ""
        local pos = { x = xs[i], y = ys[i] }
        --if aux.getByPos(pos) > 0.5 then
        --    --- Mundane
        --    newTileName = "vegetation-olive-grass-2"
        --else
        --    --- Alien
        newTileName = alienBiomeTilename_get(pos)
        --end
        table.insert(tiles, { name = newTileName, position = pos })
    end

    return tiles
end
