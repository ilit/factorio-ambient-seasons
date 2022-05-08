local constants = require "code/constants"

function biomes.getNumberForStepAndCell(step, x, y, chunk)
    if (biomes[step] == nil) then
        error("biomes[step] == nil table_size(biomes) is "..table_size(biomes))
    end

    local startingIndex = biomes.indexOfAChunk(step, chunk)

    for i=startingIndex,biomes.cellsLength(step) do
        if (biomes[step]["xs"][i] == x and
                biomes[step]["ys"][i] == y) then
            return biomes[step]["biomes"][i]
        end
    end
    error("cell "..x.." "..y.." not found for chunk "..chunk.x.." "..chunk.y)
end

function biomes.cellsLength(step)
    if not step then error("not step") end

    return #biomes[step]["xs"]
end

function biomes.indexOfAChunk(step, chunk)
    if not step then error("not step") end
    if not biomes[step] then return constants.CHUNK_NOT_FOUND end

    local len = #biomes[step]["chxs"]

    if len == 0 then return constants.CHUNK_NOT_FOUND end

    for i=1,len do
        if (biomes[step]["chxs"][i] == chunk.x and
                biomes[step]["chys"][i] == chunk.y) then
            return biomes[step]["index"][i]
        end
    end
    return constants.CHUNK_NOT_FOUND
end