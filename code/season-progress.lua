if not seasonProgress then seasonProgress = {} end

time = require "code/functions-lib/time/time"
seasonStep = require "code/season-step"

function seasonProgress.onTick()
    if (time.steps.isAtFirstTickOfAStep()) then
        seasonStep(time)
    end
end

return seasonProgress
