terrain = {}

function terrain.newTiles(time, positionsToModify)
    local tiles = {}

    for i, pos in ipairs(positionsToModify) do
        local newTileName = {}
        local isCooling = time.currentMonth % 2 == 1
        if (isCooling) then
            --local tile = game.surfaces.nauvis.get_tile(pos.x, pos.y)
            newTileName = "frozen-snow-1"
        else
            newTileName = "mineral-cream-sand-1"
        end
        table.insert(tiles, {name = newTileName, position = {pos.x, pos.y}})
    end

    return tiles
end

return terrain
