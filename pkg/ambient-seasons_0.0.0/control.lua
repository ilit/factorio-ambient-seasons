require "code.main"

if not main then main = {} end

script.on_event(defines.events.on_tick, function(event)
    main.ontick()
end)
