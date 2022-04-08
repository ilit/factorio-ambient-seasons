return function (time, positionsToModify)
    local tiles = {}

    for _, pos in ipairs(positionsToModify) do
        local season = time.currentMonth % 2 + 1

        local newTileName = ""
        if (season == 1) then
            newTileName = "frozen-snow-1"
        else
            newTileName = "vegetation-olive-grass-2"
        end
        table.insert(tiles, {name = newTileName, position = {pos.x, pos.y}})
    end

    return tiles
end
