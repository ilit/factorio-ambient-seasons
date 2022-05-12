local biomes = require "code/persistence/biomes-cache"

local insertNewIndexLocation = function(step, chunkPos)
    --- No record of index for this chunk
    table.insert(biomes[step].chxs, chunkPos.x)
    table.insert(biomes[step].chys, chunkPos.y)

    local indexForANewChunk = #biomes[step].xs
    table.insert(biomes[step].index, indexForANewChunk)
end

--- Store index of first occurence of cell of a chunk for performance.
--- No need to traverse over all cells for a cell search.
--- Start with index stored here.
return function (step, chunkPos)
    if not biomes[step].chxs then biomes[step].chxs = {} end
    if not biomes[step].chys then biomes[step].chys = {} end
    if not biomes[step].index then biomes[step].index = {} end

    if (#biomes[step].chxs == 0) then
        return insertNewIndexLocation(step, chunkPos)
    end

    for i=1,#biomes[step].chxs do
        if (biomes[step].chxs[i] == chunkPos.x and
            biomes[step].chys[i] == chunkPos.y) then
            --- Index record for this chunk is already present
            return
        end
    end

    return insertNewIndexLocation(step, chunkPos)
end
