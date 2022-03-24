seasonProgress = require "code/season-progress"

globalVarTest = 0

registerOnTickEvent = function(str)
    script.on_event(defines.events.on_tick, function(event)
        seasonProgress.onTick()
        --globalVarTest = globalVarTest + 1
        --game.print(globalVarTest)
    end)
end

script.on_init(registerOnTickEvent)
script.on_load(registerOnTickEvent)
