--log noise
return function(valsToPos)
    for i, triplet in ipairs(valsToPos) do
        local noise = triplet[1]
        local x = triplet[2]
        local y = triplet[3]

        log(x .." ".. y .." ".. noise)
    end
end
