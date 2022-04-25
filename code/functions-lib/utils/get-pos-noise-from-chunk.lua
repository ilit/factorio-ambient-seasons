--- pos position to find index in noiseX, noiseY
--- noiseVals array with index
--- noiseX array with index
--- noiseY array with index
--- returns noise value from noiseVals by index
return function(pos, noiseVals, noiseX, noiseY)
    if not pos.x then error("No position argument!") end
    if not noiseVals then error("No chunk argument!") end

    for i = 1,#noiseVals do
        if noiseX[i] == pos.x and noiseY[i] == pos.y then
            return noiseVals[i]
        end
    end

    error("No position ".. pos.x.." ".. pos.y.." in chunkNoise")
end
