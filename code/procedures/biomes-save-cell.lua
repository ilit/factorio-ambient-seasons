local biomes = require "code/persistence/biomesCache"

return function (x, y, step, biome)
    if not x then error("not x") end
    if step < 1 then error("step < 1") end
    if not biome then error("not biome") end

    if not biomes[step] then biomes[step] = {} end
    if not biomes[step]["xs"] then biomes[step]["xs"] = {} end
    if not biomes[step]["ys"] then biomes[step]["ys"] = {} end
    if not biomes[step]["biomes"] then biomes[step]["biomes"] = {} end

    for i, _ in ipairs(biomes[step]["xs"]) do
        if (biomes[step]["xs"][i] == x and
            biomes[step]["ys"][i] == y) then
            error("Position is already present in cache")
        end
    end

    table.insert(biomes[step]["xs"], x)
    table.insert(biomes[step]["ys"], y)
    table.insert(biomes[step]["biomes"], biome)
end
