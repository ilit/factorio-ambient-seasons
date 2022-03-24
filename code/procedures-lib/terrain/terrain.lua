terrain = {}

function terrain.newTiles(positionsToModify)
    for i, pos in ipairs(positionsToModify) do

    end


    local isCooling = time.months.current() % 2 == 0
    if (isCooling) then
        game.print("cooling ")
        local tile = game.surfaces.nauvis.get_tile(pos.x, pos.y)
        game.print(tile.prototype.name)
        --frozen-snow-1
        --mineral-cream-sand-1
    else
        game.print("warming")
    end
end

return terrain
