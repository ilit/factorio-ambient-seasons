local taskQueue = require "code/persistence/tasks-queue"
local writeSeasonOverChunk = require "code/procedures/write-season-over-chunk.lua"

return function()
    game.print("Executing! taskQueue:length() " .. taskQueue:length())
    if not taskQueue:is_empty() then
        local task = taskQueue:pop_left()
        writeSeasonOverChunk(task.time, task.chunk)
    end
end
