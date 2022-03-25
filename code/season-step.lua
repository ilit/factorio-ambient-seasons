time = require "code/functions-lib/time/time"
local elevation = require "code/functions-lib/noise/elevation"
local filterPositionsByNoise = require "code/functions-lib/noise/pos-filter-min-max"
local terrain = require "code/procedures-lib/terrain/terrain"
local printStepDebugData = require "code/debug/print-step-debug-data.lua"

return function()
    for chunk in game.surfaces.nauvis.get_chunks() do
        game.print("QQ")
        if game.surfaces.nauvis.is_chunk_generated(chunk) then -- TODO not working
            --if not chunk.valid then
            --    game.print("chunk invalid " .. chunk.x .. "-" .. chunk.y)
            --end

            local noiseToPos = elevation.get(chunk)

            local positionsToModify = filterPositionsByNoise(
                    noiseToPos,
                    time.months.leftPart(),
                    time.months.rightPart()
            )

            local newTiles = terrain.newTiles(positionsToModify)
            for i, pos in ipairs(positionsToModify) do
                local tile = game.surfaces.nauvis.get_tile(pos.x, pos.y)
                if (not tile.valid) then
                    game.print("invalid tile")
                end
            end

            game.surfaces.nauvis.set_tiles(newTiles)
            --flora.update()

            printStepDebugData()
        end
    end
end
