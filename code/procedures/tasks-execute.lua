local taskQueue = require "code/persistence/tasks-queue"
local writeSeasonOverChunk = require "code/procedures/write-season-over-chunk.lua"

return function()
    if not taskQueue:is_empty() then
        local task = taskQueue:pop_left()
        writeSeasonOverChunk(task.time, task.chunk)
    end
end
