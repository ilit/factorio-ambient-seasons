local seasonProgress = require "code/season-progress"
local tasksQueueExec = require "code/procedures/tasks-execute"
local pregenerateChunkCaches = require "code/procedures/pregenerate-chunk-caches"

local registerEvents = function()
    script.on_event(defines.events.on_tick, function(event)
        seasonProgress()
        tasksQueueExec()
    end)

    script.on_event(defines.events.on_chunk_generated, function(event)
        if event.surface.index == 1 then
            pregenerateChunkCaches(event.surface, event.position)
        end
    end)

    --script.on_event(defines.events.on_chunk_charted, function(event)
    --    if (event.surface_index == 1) then
    --        -- touchSeasoning
    --    end
    --end)
end

local init = function()
    registerEvents()
end

script.on_init(init)
script.on_load(init)
