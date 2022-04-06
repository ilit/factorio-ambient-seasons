local tileTransitions = require "transition-tables/tile-transitions"

return function (time, positionsToModify)
    local tiles = {}

    for _, pos in ipairs(positionsToModify) do
        local season = time.currentMonth % 4 + 1

        temperature

        --local newTileName = tileTransitions.deciduous[season]

        --table.insert(tiles, {name = newTileName, position = {pos.x, pos.y}})
    end

    return tiles
end
