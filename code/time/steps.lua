if not steps then steps = {} end

steps.seconds = {}

function steps.init(secondsArg)
    steps.seconds = secondsArg
end

function steps.playedFloat()
    local SECONDS_IN_A_STEP = 1.2
    return seconds.playedFloat() / SECONDS_IN_A_STEP
end

function steps.played()
    return math.floor(steps.playedFloat())
end

function steps.isAtFirstTickOfAStep()
    return steps.played() - steps.playedFloat() == 0
end

return steps
