if not months then months = {} end

months.STEPS_IN_A_MONTH = 9

months.steps = {}

function months.init(stepsArg)
    months.steps = stepsArg
end

function months.playedFloat()
    return months.steps.played() / months.STEPS_IN_A_MONTH
end

function months.played()
    return math.floor(months.playedFloat())
end

function months.current()
    local MONTHS_IN_A_YEAR = 12
    return months.played() % MONTHS_IN_A_YEAR + 1
end

function months.passedPart()
    return months.playedFloat() - months.played()
end

return months
