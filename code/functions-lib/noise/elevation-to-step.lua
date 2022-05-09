local constants = require "code/constants"
local STEPS_BEFORE_INF = constants.STEPS_IN_A_MONTH - 1

return function(elevationValue)
    if constants.STEPS_IN_A_MONTH == 1 then return 1 end

    --- Below sea level
    if elevationValue <= 0 then return 1 end

    local stepSize = constants.TOP_ELEVATION / STEPS_BEFORE_INF
    local step = math.floor(elevationValue / stepSize) + 1

    if step < 1 then error("step < 1 for elevationValue "..elevationValue) end

    step = math.min(step, constants.STEPS_IN_A_MONTH)

    return step
end
