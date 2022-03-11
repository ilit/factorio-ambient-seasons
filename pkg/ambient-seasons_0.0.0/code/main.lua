require "code.season_progress"
require "code.season_surface_step"

if not main then main = {} end

function main.ontick()
    if (game) then
        seasonProgress.onStep(seasonSurfaceStep.exec)
    end
end
