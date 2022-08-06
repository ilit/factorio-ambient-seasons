local seasonProgress = require "code/season-progress"
local tasksQueueExec = require "code/procedures/tasks-execute"

local registerEvents = function()
    script.on_event(defines.events.on_tick, function(_)
        seasonProgress()
        tasksQueueExec()
    end)
end

local init = function()
    registerEvents()
end

script.on_init(init)
script.on_load(init)

if script.active_mods["gvv"] then require("__gvv__.gvv")() end
