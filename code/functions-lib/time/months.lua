local months = {}

local constants = require "code/constants"
local steps = require "code/functions-lib/time/steps"

function months.playedFloat()
    return steps.totalPlayed() / constants.STEPS_IN_A_MONTH
end

function months.played()
    return math.floor(months.playedFloat())
end

function months.current()
    return months.played() % constants.MONTHS_IN_A_YEAR + 1
end

function months.leftPart()
    return months.playedFloat() - months.played()
end

function months.rightPart()
    return months.leftPart() + 1 / constants.STEPS_IN_A_MONTH
end

return months
