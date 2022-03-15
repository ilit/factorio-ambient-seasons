registerOnTickEvent1 = function(str)
    script.on_event(defines.events.on_tick, function(event)
        game.print("111") 
        ontick()
    end)
end

registerOnTickEvent2 = function(str)
    script.on_event(defines.events.on_tick, function(event)
        game.print("222") 
        ontick()
    end)
end

script.on_init(registerOnTickEvent1)
script.on_load(registerOnTickEvent2)

seasonProgress = require "code/season-progress"
seasonSurfaceStepExec = require "code/season-step"

function ontick()
    seasonProgress.onStep(seasonSurfaceStepExec)
end
