local taskQueue = require "code/persistence/tasks-queue"
local writeSeasonOverChunk = require "code/procedures/write-season-over-chunk.lua"
local CHUNKS_PROCESSED_PER_TICK = 10

return function()
    for i=1,CHUNKS_PROCESSED_PER_TICK do
        if not taskQueue:is_empty() then
            local task = taskQueue:pop_left()
            writeSeasonOverChunk(task.time, task.chunk)
        end
    end
end
