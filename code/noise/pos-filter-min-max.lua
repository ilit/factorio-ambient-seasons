-- Filter positions by min-max noise values
--filterPositionsByNoise
return function(valsToPos, min, max)
    local ret = {}
    for i, triplet in ipairs(valsToPos) do
        local noise = triplet[1]
        local x = triplet[2]
        local y = triplet[3]

        if min <= noise and noise < max then
            ret[#ret +1] = { x, y }
        end
    end

    return ret
end