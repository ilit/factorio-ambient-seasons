local chunkToPositions = require "code/functions-lib/positions/chunk-to-positions-factorio"
local elevationToStep = require "code/functions-lib/noise/elevation-to-step"
local biomeEvalForCell = require "code/functions-lib/biome/biome-number-eval-for-cell"
local biomesSaveCell = require "code/procedures/biomes-save-cell"
local biomesSaveChunkIndex = require "code/procedures/biomes-save-chunk-index"
local getSurface = require "external/surface"

return function(chunkPos)
    local chunkPositions = chunkToPositions(chunkPos)
    local calcResults = getSurface().calculate_tile_properties({ "elevation", "aux"}, chunkPositions)
    local elevations = calcResults["elevation"]
    local auxes = calcResults["aux"]
    --- 1ms

    local prof1 = game.create_profiler(true)
    --- Save cell data
    for i=1,#elevations do
        local x = chunkPositions[i].x
        local y = chunkPositions[i].y

        local step = elevationToStep(elevations[i]) --- 0.7ms
        local aux = auxes[i]

        local biome = biomeEvalForCell(x, y, aux) --- 16ms


        if not biome then error("not biome") end

        biomesSaveCell(x, y, step, biome, prof1) --- 38ms
        --- Save chunk->index data
        biomesSaveChunkIndex(step, chunkPos) --- 0.8ms
    end --- 60ms all loops combined for a chunk

    error(prof1)
end
