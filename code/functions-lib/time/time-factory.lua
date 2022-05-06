local steps = require "code/functions-lib/time/steps"
local months = require "code/functions-lib/time/months"

return function()
    local time = {}
    time.isAtFirstTickOfAStep = steps.isAtFirstTickOfAStep()
    time.currentMonth = months.current()
    time.currentStepOfAMonth = steps.stepOfAMonth()

    return time
end
