local taskQueueAdd = require "code/procedures/tasks-add"
local printStepDebugData = require "code/debug/print-step-debug-data.lua"
local taskQueue = require "code/persistence/tasks-queue"
local getSurface = require "external/surface"
local TOUCH_DIST = 7

return function(time)
    game.print("before step taskQueue::length "..taskQueue:length())
    for chunk in getSurface().get_chunks() do
        if getSurface().is_chunk_generated(chunk) then
            if chunk.x < TOUCH_DIST and chunk.x > -TOUCH_DIST and chunk.y < TOUCH_DIST and chunk.y > -TOUCH_DIST then
                taskQueueAdd(time, chunk)
            end
        end
    end
    game.print("after step taskQueue::length "..taskQueue:length())
    printStepDebugData(time)
end
