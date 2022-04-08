-- Filter positions by min-max noise values
--filterPositionsByNoise
return function(valsToPos, min, max)
    local ret = {}
    for _, triplet in ipairs(valsToPos) do
        local noise = triplet[1]
        local pos = {}
        pos.x = triplet[2]
        pos.y = triplet[3]

        if min <= noise and noise < max then
            ret[#ret +1] = pos
        end
    end

    return ret
end
