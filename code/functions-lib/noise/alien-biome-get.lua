local worldPosToVoronoiFrame = require "code/functions-lib/positions/world-pos-to-voronoi-frame"
local constants = require "code/constants"
local Position = require('__stdlib__/stdlib/area/position')

local gameRnd

return function(worldTilePos)
    if (gameRnd == nil) then
        gameRnd = game.create_random_generator()
    end

    --- Eval current Voronoi frame
    local currVorFrame = worldPosToVoronoiFrame(worldTilePos)

    --- Eval 9 nearest Voronoi sites
    local nearestVoronoiSites = {}
    for i=-1,1 do
        for j=-1,1 do

            local cellX = currVorFrame.x + i
            local cellY = currVorFrame.y + j

            --- Eval its Site
            gameRnd.re_seed(cellX + cellY * 12345 + 2000111000)
            local siteXrelOffset = gameRnd()

            gameRnd.re_seed(cellX * 12345 + cellY + 2333111000)
            local siteYrelOffset = gameRnd()

            local siteWorldX = (siteXrelOffset + cellX) * constants.VORONOI_FRAME_SIZE
            local siteWorldY = (siteYrelOffset + cellY) * constants.VORONOI_FRAME_SIZE

            local site = { x = siteWorldX, y = siteWorldY }

            nearestVoronoiSites[#nearestVoronoiSites + 1] = site
        end
    end

    --- Eval single nearest Voronoi cell
    local nearestSite = Position.closest(worldTilePos, nearestVoronoiSites)

    if (math.abs(worldTilePos.x - nearestSite.x) < 2.1) and (math.abs(worldTilePos.y - nearestSite.y) < 2.1) then
        return "vegetation-red-grass-2"
    end

    --for _,site in pairs(nearestVoronoiSites) do
    --    if (math.abs(worldTilePos.x - site.x) < 1.1) and (math.abs(worldTilePos.y - site.y) < 1.1) then
    --        return "vegetation-red-grass-2"
    --    end
    --end

    gameRnd.re_seed(nearestSite.x + nearestSite.y * 123456 + 111222000)
    local r = gameRnd()
    if (r > 0.9) then
        return "vegetation-mauve-grass-2"
    elseif(r > 0.8) then
        return "vegetation-red-grass-2"
    elseif(r > 0.6) then
        return "vegetation-blue-grass-2"
    elseif(r > 0.4) then
        return "vegetation-yellow-grass-2"
    elseif(r > 0.2) then
        return "vegetation-violet-grass-2"
    else
        return "vegetation-purple-grass-2"
    end
end
