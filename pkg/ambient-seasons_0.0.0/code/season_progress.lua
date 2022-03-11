if not seasonProgress then seasonProgress = {} end

local SEASON_SPEED = 8 --seconds to pass all seasons
local STEPS_IN_A_YEAR = 12
local STEP_SIZE = 1 / STEPS_IN_A_YEAR

local lastCompletedStep = -1

function seasonProgress.onStep(onStepCallback)
    currentStep = math.floor(evalTime() / STEP_SIZE) % STEPS_IN_A_YEAR
    if (currentStep ~= lastCompletedStep) then
        lastCompletedStep = currentStep
        onStepCallback(currentStep)
    end
end



-- 0 to 1 --
function evalTime()
    local secondsPlayed = game.ticks_played / 60
    return secondsPlayed / SEASON_SPEED
end
