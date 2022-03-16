seasonProgress = require "code/season-progress"

registerOnTickEvent = function(str)
    script.on_event(defines.events.on_tick, function(event)
        seasonProgress.onTick()
    end)
end

script.on_init(registerOnTickEvent)
script.on_load(registerOnTickEvent)
