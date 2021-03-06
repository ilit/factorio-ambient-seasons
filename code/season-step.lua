local taskQueueAdd = require "code/procedures/tasks-add"
local printStepDebugData = require "code/debug/print-step-debug-data.lua"
local taskQueue = require "code/persistence/tasks-queue"
local getSurface = require "external/surface"

return function(time)
    game.print("before step taskQueue::length "..taskQueue:length())
    for chunk in getSurface().get_chunks() do
        if getSurface().is_chunk_generated(chunk) then
            taskQueueAdd(time, chunk)
        end
    end
    game.print("after step taskQueue::length "..taskQueue:length())
    printStepDebugData(time)
end
