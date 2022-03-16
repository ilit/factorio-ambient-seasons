if not time then time = {} end

function time.secondsPlayedFloat()
    local TICKS_IN_A_SECOND = 60
    return game.ticks_played / TICKS_IN_A_SECOND
end

function time.stepsPlayedFloat()
    local SECONDS_IN_A_STEP = 3
    return time.secondsPlayedFloat() / SECONDS_IN_A_STEP
end

function time.stepsPlayed()
    return math.floor(time.stepsPlayedFloat())
end

function time.monthsPlayedFloat()
    local STEPS_IN_A_MONTH = 4
    return time.secondsPlayedFloat() / STEPS_IN_A_MONTH
end

function time.isAtFirstTickOfAStep()
    return time.stepsPlayed() - time.stepsPlayedFloat() == 0
end

return time