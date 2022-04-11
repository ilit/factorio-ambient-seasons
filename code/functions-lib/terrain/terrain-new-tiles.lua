local aux = require "code/functions-lib/noise/aux"

return function (time, noiseX, noiseY)
    local tiles = {}
    local season = time.currentMonth % 2 + 1

    for i = 1, #noiseX do
        local newTileName = ""
        local pos = { x = noiseX[i], y = noiseY[i] }
        if (season == 1) then
            newTileName = "frozen-snow-1"
        else
            if aux.getByPos(pos) > 0.5 then
                newTileName = "vegetation-olive-grass-2"
            else
                newTileName = "vegetation-mauve-grass-2"
            end
        end
        -- TODO pos instead of position
        table.insert(tiles, { name = newTileName, position = { x = pos.x, y = pos.y } })
    end

    return tiles
end
