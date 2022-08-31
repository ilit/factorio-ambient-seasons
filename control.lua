local seasonProgress = require "code/season-progress"
local tasksQueueExec = require "code/procedures/tasks-execute"
local saveChunkBiomes = require "code/procedures/save-chunk-biomes"

local registerEvents = function()
    script.on_event(defines.events.on_tick, function(_)
        seasonProgress()
        tasksQueueExec()
    end)

    --## Manual Cache Generation
    --saveChunkBiomes({x = 0, y = 0})
    --saveChunkBiomes({x = 1, y = 1})
    -- TODO Why this fails?!!
    -- TODO Probably NOT ReADY
    for xi=0,4,1 do
        for yi=0,4,1 do
            --saveChunkBiomes({x = xi, y = yi})
        end
    end
end

local init = function()
    registerEvents()
end

script.on_init(init)
script.on_load(init)

if script.active_mods["gvv"] then require("__gvv__.gvv")() end
