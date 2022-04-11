local steps = {}

local seconds = require "code/functions-lib/time/seconds"
local constants = require "code/constants"

function steps.playedFloat()
    return seconds.playedFloat() / constants.SECONDS_IN_A_STEP
end

function steps.played()
    return math.floor(steps.playedFloat())
end

function steps.isAtFirstTickOfAStep()
    -- Simply comparing with 0 is broken
    local FLOAT_PRECISION_THRESHOLD_FIX = 0.000001
    return math.abs(steps.played() - steps.playedFloat()) < FLOAT_PRECISION_THRESHOLD_FIX
end

return steps
