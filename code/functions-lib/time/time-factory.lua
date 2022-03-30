local timeFactory = {}

timeFactory.seconds = require "code/functions-lib/time/seconds"
timeFactory.steps = require "code/functions-lib/time/steps"
timeFactory.steps.init(seconds)
timeFactory.months = require "code/functions-lib/time/months"
timeFactory.months.init(steps)

return function()
    local time = {}
    time.isAtFirstTickOfAStep = timeFactory.steps.isAtFirstTickOfAStep()
    time.currentMonth = timeFactory.months.current()
    time.monthLeftRelPart = timeFactory.months.leftPart()
    time.monthRightRelPart = timeFactory.months.rightPart()

    return time
end
