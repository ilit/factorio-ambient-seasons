local getOriginalTile = require "code/functions-lib/terrain/tile-original-get"

return function (time, positionsToModify)
    local tiles = {}

    for _, pos in ipairs(positionsToModify) do
        local newTileName = {}
        local isCooling = time.currentMonth % 2 == 1
        if (isCooling) then
            -- TODO Does snow overwrite Ore? How to save? Store
            -- Or skip Ores
            -- Put snow
            newTileName = "frozen-snow-1"
        else
            -- Get the old tile back
            local originalTile = getOriginalTile(pos.x, pos.y)
            --newTileName = "mineral-cream-sand-1"
            newTileName = originalTile.prototype.name
        end
        table.insert(tiles, {name = newTileName, position = {pos.x, pos.y}})
    end

    return tiles
end
