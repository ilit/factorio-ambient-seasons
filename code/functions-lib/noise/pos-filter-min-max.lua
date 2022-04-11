-- Filter positions by min-max noise values
--filterPositionsByNoise
return function(valsToPos, min, max)
    if valsToPos == nil then error("valsToPos == nil") end
    if valsToPos[1] == nil then error("valsToPos[1] == nil") end
    if valsToPos[1].x == nil then error("valsToPos[1].x == nil") end
    if valsToPos[1].val == nil then error("valsToPos[1].val == nil") end
    if min == nil then error("min == nil") end
    if max == nil then error("max == nil") end

    local ret = {}
    for _, triplet in ipairs(valsToPos) do
        local noise = triplet.val
        local pos = {}
        pos.x = triplet.x
        pos.y = triplet.y

        if min <= noise and noise < max then
            ret[#ret +1] = pos
        end
    end

    return ret
end
