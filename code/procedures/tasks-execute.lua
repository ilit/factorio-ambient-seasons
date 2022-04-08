local taskQueue = require "code/persistence/tasks-queue"
local writeSeasonOverChunk = require "code/procedures/write-season-over-chunk.lua"

local CHUNKS_PROCESSED_PER_TICK = 20

return function()
    for _=1,CHUNKS_PROCESSED_PER_TICK do
        if not taskQueue:is_empty() then
            local task = taskQueue:pop_left()
            local chunk = task.chunk

            writeSeasonOverChunk(task.time, chunk)
        end
    end

    --game.print("unreadyChunksLen " .. unreadyChunksLen .. " requested")
    --game.print("taskQueue:length() " .. taskQueue:length())
    --game.print("")
end
