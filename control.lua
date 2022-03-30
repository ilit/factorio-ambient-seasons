local elevation = require "code/functions-lib/noise/elevation"
local seasonProgress = require "code/season-progress"
local tasksQueueExec = require "code/procedures/tasks-execute"

local registerEvents = function(str)
    script.on_event(defines.events.on_tick, function(event)
        seasonProgress()
        tasksQueueExec()
    end)

    script.on_event(defines.events.on_chunk_generated, function(event)
        -- Pregenerate caches
        if (event.surface.index == 1) then
            local chunkPos = event.position
            event.surface -- TODO get Chunk out of chunkPos
            game.print("Pregenerating chunk " .. chunk.x .." " .. chunk.y)
            elevation.get(chunk)
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
