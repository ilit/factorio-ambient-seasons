local seasonProgress = require "code/season-progress"
local tasksQueueExec = require "code/procedures/tasks-execute"
local saveChunkBiomes = require "code/procedures/save-chunk-biomes"

local registerEvents = function()
    script.on_event(defines.events.on_tick, function(_)
        seasonProgress()
        tasksQueueExec()
    end)

    --- Not called for start area chunks
    script.on_event(defines.events.on_chunk_generated, function(event)
        if event.surface.index == 1 then
            saveChunkBiomes(event.position)
        end
    end)
end

local init = function()
    registerEvents()
end

script.on_init(init)
script.on_load(init)

if script.active_mods["gvv"] then require("__gvv__.gvv")() end
