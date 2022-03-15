script.on_load(function()
    script.on_event(defines.events.on_tick, function(event)
        ontick()
    end)
end)

seasonProgress = require "code/season-progress"
seasonSurfaceStepExec = require "code/season-step"

function ontick()
    seasonProgress.onStep(seasonSurfaceStepExec)
end
