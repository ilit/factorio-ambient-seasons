local taskQueueAdd = require "code/procedures/tasks-add"
local printStepDebugData = require "code/debug/print-step-debug-data.lua"

local taskQueue = require "code/persistence/tasks-queue"

return function(time)
    game.print("before step taskQueue::length "..taskQueue:length())
    for chunk in game.surfaces.nauvis.get_chunks() do
        if game.surfaces.nauvis.is_chunk_generated(chunk) then
            taskQueueAdd(time, chunk)
        end
    end
    game.print("after step taskQueue::length "..taskQueue:length())
    printStepDebugData(time)
end
