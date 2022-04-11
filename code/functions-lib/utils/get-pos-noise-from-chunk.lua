--- @chunkNoise format noiseValsToPos[#noiseValsToPos+1] = { val, x, y }
return function(pos, chunkNoise)
    if not pos.x then error("No position argument!") end
    if not chunkNoise then error("No chunk argument!") end

    for _, t in ipairs(chunkNoise) do
        if t.x == pos.x and t.y == pos.y then
            return t.val
        end
    end

    error("No position ".. pos.x.." ".. pos.y.." in chunkNoise")
end
