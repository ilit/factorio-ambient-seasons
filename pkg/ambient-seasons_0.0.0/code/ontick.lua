require "code.season_progress"
require "code.season_surface_step"

return function()
    seasonProgress.onStep(seasonSurfaceStep.exec)
end
