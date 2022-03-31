local getOriginalTile = require "code/functions-lib/terrain/tile-original-get"

return function (time, positionsToModify)
    local tiles = {}

    for i, pos in ipairs(positionsToModify) do
        local newTileName = {}
        local isCooling = time.currentMonth % 2 == 1
        if (isCooling) then
            newTileName = "frozen-snow-1"
        else
            -- Get the old tile back
            --local tile = game.surfaces.nauvis.get_tile(pos.x, pos.y)
            -- TODO HERE
            local originalTile = getOriginalTile(pos.x, pos.y)
            newTileName = "mineral-cream-sand-1"
        end
        table.insert(tiles, {name = newTileName, position = {pos.x, pos.y}})
    end

    return tiles
end
