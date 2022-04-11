--- Filter positions by min-max noise values
--- filterPositionsByNoise
return function(noiseVals, noiseX, noiseY, min, max)
    local retX = {}
    local retY = {}
    for i=1,#noiseVals do
        if min <= noiseVals[i] and noiseVals[i] < max then
            retX[#retX+1] = noiseX[i]
            retY[#retY+1] = noiseY[i]
        end
    end

    return retX, retY
end
