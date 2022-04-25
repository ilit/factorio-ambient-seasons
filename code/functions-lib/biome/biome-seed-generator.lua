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

    gameRnd.re_seed(nearestSite.x + nearestSite.y * 123456 + 111222000)
    local randomBiomeSeedFloatValue = gameRnd()

    return randomBiomeSeedFloatValue
end
