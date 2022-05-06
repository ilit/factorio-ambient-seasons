local biomes = require "code/persistence/biomes"

--- Store index of first occurence of cell of a chunk for performance
--- No need to traverse over all cells for a cell search.
--- Start with index stored here.
return function (step, chunkPos)
    if not biomes[step]["chxs"] then biomes[step]["chxs"] = {} end
    if not biomes[step]["chys"] then biomes[step]["chys"] = {} end
    if not biomes[step]["index"] then biomes[step]["index"] = {} end

    local x = chunkPos.x
    local y = chunkPos.y

    if (not biomes[step][x] and not biomes[step][x]) then
        --- No record of index for this chunk
        table.insert(biomes[step]["chxs"], x)
        table.insert(biomes[step]["chys"], y)

        local indexForANewChunk = biomes.cellsLength(step) + 1
        table.insert(biomes[step]["index"], indexForANewChunk)
    end
end
