local chunkToPositions = require "code/functions-lib/positions/chunk-to-positions-factorio"
local elevationToStep = require "code/functions-lib/noise/elevation-to-step"
local biomeEvalForCell = require "code/functions-lib/biome/biome-number-eval-for-cell"
local biomesSaveCell = require "code/procedures/biomes-save-cell"
local biomesSaveChunkIndex = require "code/procedures/biomes-save-chunk-index"
local getSurface = require "external/surface"

local prof1
local prof2
local profilersCreated = false

return function(chunkPos)
    if game then
        if not profilersCreated then
            prof1 = game.create_profiler(true)
            prof2 = game.create_profiler(true)
            profilersCreated = true
        end
        -- TODO Here. Not printing
        if game.ticks_played > 20 then error("##### "..prof1.." "..prof2) end
    end

    prof1.restart()
    local chunkPositions = chunkToPositions(chunkPos)
    local calcResults = getSurface().calculate_tile_properties({ "elevation", "aux"}, chunkPositions)
    local elevations = calcResults["elevation"]
    local auxes = calcResults["aux"]
    prof1.stop()

    prof2.restart()
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
    prof2.stop()
end
