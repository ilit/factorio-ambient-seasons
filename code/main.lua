require "code.season_progress"
require "code.season_step"

if not main then main = {} end

function main.ontick()
    if (game) then
        seasonProgress.onStep(seasonStep.exec)
    end
end
