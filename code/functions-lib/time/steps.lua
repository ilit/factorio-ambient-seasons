local steps = {}

local seconds = require "code/functions-lib/time/seconds"
local constants = require "code/constants"

function steps.totalPlayedFloat()
    return seconds.playedFloat() / constants.SECONDS_IN_A_STEP
end

function steps.totalPlayed()
    return math.floor(steps.totalPlayedFloat())
end

function steps.stepOfAMonth()
    return steps.totalPlayed() % constants.STEPS_IN_A_MONTH + 1
end

function steps.isAtFirstTickOfAStep()
    -- Simply comparing with 0 is broken
    local FLOAT_PRECISION_THRESHOLD_FIX = 0.000001
    return math.abs(steps.totalPlayed() - steps.totalPlayedFloat()) < FLOAT_PRECISION_THRESHOLD_FIX
end

return steps
