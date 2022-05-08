return function()
    --- Clear table without dereferencing
    for k,_ in pairs(biomes) do
        biomes[k] = nil
    end
end