local aux = require "code/functions-lib/noise/aux"
local alienBiomeTilename_eval = require "code/functions-lib/noise/alien-biome-eval"

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
        newTileName = alienBiomeTilename_eval(pos)
        --end
        table.insert(tiles, { name = newTileName, position = pos })
    end

    return tiles
end
