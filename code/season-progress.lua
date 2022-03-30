local seasonProgress = {}

local newTime = require "code/functions-lib/time/time-factory"
local seasonStep = require "code/season-step"

function seasonProgress.onTick()
    local time = newTime()
    if (time.isAtFirstTickOfAStep) then
        seasonStep(time)
    end
end

return seasonProgress
