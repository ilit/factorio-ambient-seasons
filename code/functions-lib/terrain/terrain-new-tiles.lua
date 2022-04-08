local aux = require "code/functions-lib/noise/aux"

return function (time, positionsToModify)
    local tiles = {}

    for _, pos in ipairs(positionsToModify) do
        local season = time.currentMonth % 2 + 1

        local newTileName = ""
        if (season == 1) then
            newTileName = "frozen-snow-1"
        else
            if aux.getByPos(pos) > 0.5 then
                newTileName = "vegetation-olive-grass-2"
            else
                newTileName = "vegetation-mauve-grass-2"
            end
        end
        table.insert(tiles, {name = newTileName, position = {pos.x, pos.y}})
    end

    return tiles
end
