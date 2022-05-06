local chunkToPositions = require "code/functions-lib/positions/chunk-to-positions-factorio"
local elevationToStep = require "code/functions-lib/noise/elevation-to-step"
local biomeEvalForCell = require "code/functions-lib/biome/biome-number-eval-for-cell"
local biomesSaveCell = require "code/procedures/biomes-save-cell"
local biomesSaveChunkIndex = require "code/procedures/biomes-save-chunk-index"

return function(chunkPos)
    local chunkPositions = chunkToPositions(chunkPos)
    local calcResults = game.surfaces.nauvis.calculate_tile_properties({"elevation", "aux"}, chunkPositions)
    local elevations = calcResults["elevation"]
    local auxes = calcResults["aux"]

    --- Save cell data
    for i=1,#elevations do
        local x = chunkPositions[i].x
        local y = chunkPositions[i].y
        local step = elevationToStep(elevations[i])
        local aux = auxes[i]
        local biome = biomeEvalForCell(x, y, aux)

        if not biome then error("not biome") end

        biomesSaveCell(x, y, step, biome)

        --- Save chunk->index data
        biomesSaveChunkIndex(step, chunkPos)
    end
end
