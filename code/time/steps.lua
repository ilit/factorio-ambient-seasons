if not steps then steps = {} end

steps.seconds = {}

function steps.init(secondsArg)
    steps.seconds = secondsArg
end

function steps.playedFloat()
    local SECONDS_IN_A_STEP = 0.6
    return seconds.playedFloat() / SECONDS_IN_A_STEP
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
