-- Normalize to [0-1] scale
return function(rawNoiseValsToPos)
    local TOP_ELEVATION = 27

    local ret = {}
    for i, triplet in ipairs(rawNoiseValsToPos) do
        local rawNoise = triplet[1]
        local capped = math.min(rawNoise, TOP_ELEVATION)
        local normalized = capped / TOP_ELEVATION

        local x = triplet[2]
        local y = triplet[3]

        ret[#ret +1] =
        { normalized, x, y }
    end

    return ret
end