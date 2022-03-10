if not seasonprogress then seasonprogress = {} end

-- 0 to 1 --
function seasonprogress.eval()
    local secondsPlayed = game.ticks_played / 60
    local SEASON_SPEED = 30
    return (secondsPlayed % SEASON_SPEED) / SEASON_SPEED
end
