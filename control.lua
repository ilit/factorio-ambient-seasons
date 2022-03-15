registerOnTickEvent = function(str)
    script.on_event(defines.events.on_tick, function(event)
        ontick()
    end)
end

script.on_init(registerOnTickEvent)
script.on_load(registerOnTickEvent)

seasonProgress = require "code/season-progress"
seasonSurfaceStepExec = require "code/season-step"

function ontick()
    seasonProgress.onStep(seasonSurfaceStepExec)
end
