local numToTile = require "code/functions-lib/biome/alien-biome-number-to-tilename"
local biomes = require "code/functions-lib/biome/biome-cache-read"
local chunkToPositions = require "code/functions-lib/positions/chunk-to-positions-arrays"
local constants = require "code/constants"

return function (time, chunk)
    local tiles = {}
    local season = time.currentMonth % 2 + 1
    local xs, ys = chunkToPositions(chunk)

    for i = 1, #xs do
        local x = xs[i]
        local y = ys[i]
        local biomeNumber = biomes.getNumberForStepAndCell(time.currentStepOfAMonth, x, y, chunk)

        --- biomeNumber: 0 means this x,y tile is not for this step
        if (biomeNumber ~= constants.UNDEFINED_BIOME) then
            table.insert(tiles, { name = numToTile(biomeNumber),
                                  position = {x=x,y=y} })
        end
    end

    return tiles
end
