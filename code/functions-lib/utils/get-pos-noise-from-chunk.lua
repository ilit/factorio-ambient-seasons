return function(posArg, noiseChunk)
    if not posArg.x then error("No position argument!") end
    if not noiseChunk then error("No chunk argument!") end

    for _, triplet in ipairs(noiseChunk) do
        local noiseVal = triplet[1]
        local pos = {}
        if pos.x == posArg.x and pos.y == posArg.y then
            return noiseVal
        end
    end

    error("No position "..posArg.x.." "..posArg.y..
            "  in chunk "..noiseChunk.x.." "..noiseChunk.y)
end
