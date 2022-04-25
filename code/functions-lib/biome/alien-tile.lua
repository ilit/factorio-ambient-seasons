local biomeSeed = require "code/functions-lib/biome/biome-seed"

return function(worldTilePos)
    local seed = biomeSeed.getByPos(worldTilePos)

    if type(seed) ~= "number" then error("type(seed) ~= number is "..seed) end

    if (seed > 0.9) then
        return "vegetation-mauve-grass-2"
    elseif(seed > 0.8) then
        return "vegetation-red-grass-2"
    elseif(seed > 0.6) then
        return "vegetation-blue-grass-2"
    elseif(seed > 0.4) then
        return "vegetation-yellow-grass-2"
    elseif(seed > 0.2) then
        return "vegetation-violet-grass-2"
    else
        return "vegetation-purple-grass-2"
    end
end
