local months = {}

local steps = require "code/functions-lib/time/steps"

months.STEPS_IN_A_MONTH = 40

function months.playedFloat()
    return steps.played() / months.STEPS_IN_A_MONTH
end

function months.played()
    return math.floor(months.playedFloat())
end

function months.current()
    local MONTHS_IN_A_YEAR = 12
    return months.played() % MONTHS_IN_A_YEAR + 1
end

function months.leftPart()
    return months.playedFloat() - months.played()
end

function months.rightPart()
    return months.leftPart() + 1 / months.STEPS_IN_A_MONTH
end

return months
