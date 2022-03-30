local writeSeasonOverChunk = require "code/procedures/write-season-over-chunk.lua"
local printStepDebugData = require "code/debug/print-step-debug-data.lua"

return function(time)
    -- TODO migrate to chunk_charted
    -- TODO migrate to job-queue
    for chunk in game.surfaces.nauvis.get_chunks() do
        if game.surfaces.nauvis.is_chunk_generated(chunk) then
            writeSeasonOverChunk(time, chunk)

            printStepDebugData(time)
        end
    end
end
