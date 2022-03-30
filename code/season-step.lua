local writeSeasonOverChunk = require "code/procedures/write-season-over-chunk.lua"

return function()
    -- TODO migrate to chunk_charted
    -- TODO migrate to job-queue
    for chunk in game.surfaces.nauvis.get_chunks() do
        if game.surfaces.nauvis.is_chunk_generated(chunk) then
            writeSeasonOverChunk(chunk)
        end
    end
end
