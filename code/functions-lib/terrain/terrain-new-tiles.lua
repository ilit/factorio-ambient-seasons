local aux = require "code/functions-lib/noise/aux"
local n1 = require "code/functions-lib/noise/n1"
local n2 = require "code/functions-lib/noise/n2"

return function (time, noiseX, noiseY)
    local tiles = {}
    local season = time.currentMonth % 2 + 1

    for i = 1, #noiseX do
        local newTileName = ""
        local pos = { x = noiseX[i], y = noiseY[i] }

        if n1.getByPos(pos) > 0.5 then
            if n2.getByPos(pos) > 0.5 then
                newTileName = "frozen-snow-1"
            else
                newTileName = "vegetation-olive-grass-2"
            end
        else
            if n2.getByPos(pos) > 0.5 then
                newTileName = "vegetation-mauve-grass-2"
            else
                newTileName = "vegetation-violet-grass-1"
            end
        end
        --if (season == 1) then
        --    newTileName = "frozen-snow-1"
        --else
        --    if aux.getByPos(pos) > 0.5 then
        --        newTileName = "vegetation-olive-grass-2"
        --    else
        --        newTileName = "vegetation-mauve-grass-2"
        --    end
        --end
        table.insert(tiles, { name = newTileName, position = pos })
    end

    return tiles
end
