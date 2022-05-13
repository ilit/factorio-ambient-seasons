local biomes = require "code/persistence/biomes-cache"

return function (x, y, step, biome, profiler)
    if not x then error("not x") end
    if step < 1 then error("step < 1") end
    if not biome then error("not biome") end

    if not biomes[step] then biomes[step] = {} end
    if not biomes[step].xs then biomes[step].xs = {} end
    if not biomes[step].ys then biomes[step].ys = {} end
    if not biomes[step].biomesNum then biomes[step].biomesNum = {} end

    --- 0.5ms all checks for a chunk

    profiler.restart()
    for i=1,#biomes[step].xs do
        if (biomes[step].xs[i] == x and
            biomes[step].ys[i] == y) then
            error("Position is already present in cache")
        end
    end --- 26ms
    -- TODO WHY Soooo fucking sloooooow
    profiler.stop()
    game.print("#biomes[step].xs LEN "..#biomes[step].xs)

    table.insert(biomes[step].xs, x)
    table.insert(biomes[step].ys, y)
    table.insert(biomes[step].biomesNum, biome)
    --- 0.8ms for all insertions for a chunk
end
