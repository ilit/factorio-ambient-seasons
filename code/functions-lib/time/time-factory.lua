local steps = require "code/functions-lib/time/steps"
local months = require "code/functions-lib/time/months"

return function()
    local time = {}
    time.isAtFirstTickOfAStep = steps.isAtFirstTickOfAStep()
    time.currentMonth = months.current()
    time.monthLeftRelPart = months.leftPart()
    time.monthRightRelPart = months.rightPart()

    return time
end
