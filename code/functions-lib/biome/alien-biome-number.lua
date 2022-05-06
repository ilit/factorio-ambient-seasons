local biomeSeedGenerator = require "code/functions-lib/biome/biome-seed-generator"

return function(x, y)
    local seed = biomeSeedGenerator({x=x, y=y})

    if (seed > 0.9) then
        return 1
    elseif(seed > 0.8) then
        return 2
    elseif(seed > 0.6) then
        return 3
    elseif(seed > 0.4) then
        return 4
    elseif(seed > 0.2) then
        return 5
    else
        return 6
    end
end
