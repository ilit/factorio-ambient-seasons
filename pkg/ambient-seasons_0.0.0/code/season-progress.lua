if not seasonProgress then seasonProgress = {} end

time = require "code/time-evaluate"
seasonStep = require "code/season-step"

function seasonProgress.onTick()
    if (time.isAtFirstTickOfAStep()) then
        game.print(game.ticks_played)
        seasonStep()
    end
end

return seasonProgress
