local seasonProgress = require "code/season-progress"
local tasksQueueExec = require "code/procedures/tasks-execute"
local pregenerateChunkCaches = require "code/procedures/pregenerate-chunk-caches"

local registerEvents = function(str)
    script.on_event(defines.events.on_tick, function(event)
        seasonProgress()
        tasksQueueExec()
    end)

    script.on_event(defines.events.on_chunk_generated, function(event)
        if (event.surface.index == 1) then
            pregenerateChunkCaches(event.surface, event.position)
        end
    end)

    script.on_event(defines.events.on_chunk_charted, function(event)
        if (event.surface_index == 1) then
            -- TODO on_chunk_charted
            -- touchSeasoning
        end
    end)
end

script.on_init(registerEvents)
script.on_load(registerEvents)
