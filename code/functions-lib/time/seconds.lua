local seconds = {}

function seconds.playedFloat()
    local TICKS_IN_A_SECOND = 60
    return game.ticks_played / TICKS_IN_A_SECOND
end

return seconds
