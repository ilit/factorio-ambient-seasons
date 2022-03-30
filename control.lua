local elevation = require "code/functions-lib/noise/elevation"
local seasonProgress = require "code/season-progress"
local tasksQueueExec = require "code/procedures/tasks-execute"

local registerEvents = function(str)
    script.on_event(defines.events.on_tick, function(event)
        seasonProgress()
        tasksQueueExec()
    end)

    -- Pregenerate caches
    script.on_event(defines.events.on_chunk_generated, function(event)
        if (event.surface.index == 0) then
            local chunk = event.position
            game.print("Pregenerating chunk.x " .. chunk.x)
            elevation.get(chunk)
        end
    end)

    script.on_event(defines.events.on_chunk_charted, function(event)
        if (event.surface_index == 0) then
            -- TODO on_chunk_charted
            -- touchSeasoning
        end
    end)
end

script.on_init(registerEvents)
script.on_load(registerEvents)
