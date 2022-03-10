if not seasonProgress then seasonProgress = {} end

local currentStep = 0
local steps = 20

function seasonProgress.exec()
    game.print(evalTime())
    game.print(steps)
end

-- 0 to 1 --
function evalTime()
    local secondsPlayed = game.ticks_played / 60
    local SEASON_SPEED = 30
    return (secondsPlayed % SEASON_SPEED) / SEASON_SPEED
end
