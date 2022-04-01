local taskQueue = require "code/persistence/tasks-queue"
local getOriginalSurface = require "code/persistence/original-surface-get"
local writeSeasonOverChunk = require "code/procedures/write-season-over-chunk.lua"

local CHUNKS_PROCESSED_PER_TICK = 20

local isChunkReady = function(chunk)
    return getOriginalSurface().is_chunk_generated(chunk)
end

local prepareChunk = function(chunk)
    -- Translate Chunk to MapPosition
    local pos = {
        x = chunk.area.left_top.x,
        y = chunk.area.left_top.y
    }
    local RADIUS = 1
    getOriginalSurface().request_to_generate_chunks(pos, RADIUS)
end

return function()
    local unreadyChunksLen = 0
    for i=1,CHUNKS_PROCESSED_PER_TICK do
        if not taskQueue:is_empty() then
            local task = taskQueue:pop_left()
            local chunk = task.chunk
            if isChunkReady(chunk) then
                writeSeasonOverChunk(task.time, chunk)
            else -- Chunk is not ready.
                unreadyChunksLen = unreadyChunksLen + 1

                prepareChunk(chunk)
                -- Delay task
                taskQueue:push_right(task)
            end
        end
    end

    --game.print("unreadyChunksLen " .. unreadyChunksLen .. " requested")
    --game.print("taskQueue:length() " .. taskQueue:length())
    --game.print("")

    -- TODO Is this necessary?
    getOriginalSurface().force_generate_chunk_requests()
end
