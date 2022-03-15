ontick = require "code.ontick"

script.on_load(function()
    script.on_event(defines.events.on_tick, function(event)
        ontick()
    end)
end)
