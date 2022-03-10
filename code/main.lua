require "code.season_progress"

if not main then main = {} end

function main.ontick()
    if (game) then
        seasonProgress.exec()
    end
end
