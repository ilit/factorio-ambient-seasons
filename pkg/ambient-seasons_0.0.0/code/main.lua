require "code.season_progress"
require "code.season_surface_step"

main = {}

function main.ontick()
    seasonProgress.onStep(seasonSurfaceStep.exec)
end
