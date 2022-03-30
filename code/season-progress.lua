local newTime = require "code/functions-lib/time/time-factory"
local seasonStep = require "code/season-step"

return function()
    local time = newTime()
    if (time.isAtFirstTickOfAStep) then
        seasonStep(time)
    end
end
