--- Filter positions by min-max noise values
--- filterPositionsByNoise
return function(valsToPos, min, max)
    --if valsToPos == nil then error("valsToPos == nil") end
    --if valsToPos[1] == nil then error("valsToPos[1] == nil") end
    --if valsToPos[1].x == nil then error("valsToPos[1].x == nil") end
    --if valsToPos[1].val == nil then error("valsToPos[1].val == nil") end
    --if min == nil then error("min == nil") end
    --if max == nil then error("max == nil") end

    local ret = {}
    for _, t in ipairs(valsToPos) do
        if min <= t.val and t.val < max then
            ret[#ret+1] = {}
            ret[#ret].x = t.x
            ret[#ret].y = t.y
        end
    end

    return ret
end
