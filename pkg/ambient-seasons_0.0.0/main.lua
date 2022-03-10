--require "season_progress"

if not main then main = {} end

function main.ontick()
    main.log(seasonprogress.eval())
end

function main.log(message)
    if game then
        for i, p in pairs(game.players) do
            p.print(message)
        end
    else
        error(serpent.dump(message, {compact = false, nocode = true, indent = ' '}))
    end
end