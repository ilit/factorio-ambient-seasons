local timeFactory = {}

timeFactory.steps = require "code/functions-lib/time/steps"
timeFactory.months = require "code/functions-lib/time/months"

function timeFactory.newTime()
    local time = {}
    time.isAtFirstTickOfAStep = timeFactory.steps.isAtFirstTickOfAStep()
    time.currentMonth = timeFactory.months.current()
    time.monthLeftRelPart = timeFactory.months.leftPart()
    time.monthRightRelPart = timeFactory.months.rightPart()

    return time
end

return timeFactory
