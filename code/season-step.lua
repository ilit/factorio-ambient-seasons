local time = require "code/functions-lib/time/time"
local elevation = require "code/functions-lib/noise/elevation"
local filterPositionsByNoise = require "code/functions-lib/noise/pos-filter-min-max"
local terrain = require "code/procedures-lib/terrain/terrain"
local printStepDebugData = require "code/debug/print-step-debug-data.lua"

return function()
    local chunks = game.surfaces.nauvis.get_chunks()
    local generatedChunksAmount = 0
    for _ in chunks do generatedChunksAmount = generatedChunksAmount + 1 end
    game.print("#generatedChunksAmount " .. generatedChunksAmount)

    for chunk in game.surfaces.nauvis.get_chunks() do
        if game.surfaces.nauvis.is_chunk_generated(chunk) then
            --TODO migrate from Chunk Generated to on_chunk_charted & is_chunk_charted
            --if not chunk.valid then
            --    game.print("chunk invalid " .. chunk.x .. "-" .. chunk.y)
            --end

            --local noiseToPos = elevation.get(chunk)

            --local positionsToModify = filterPositionsByNoise(
            --        noiseToPos,
            --        time.months.leftPart(),
            --        time.months.rightPart()
            --)

            --local newTiles = terrain.newTiles(positionsToModify)

            --game.surfaces.nauvis.set_tiles(newTiles)
            --flora.update()

            --printStepDebugData()
        end
    end
end
