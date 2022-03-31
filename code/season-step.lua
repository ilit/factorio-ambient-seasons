local taskQueueAdd = require "code/procedures/tasks-add"
local printStepDebugData = require "code/debug/print-step-debug-data.lua"

return function(time)
    for chunk in game.surfaces.nauvis.get_chunks() do
        if game.surfaces.nauvis.is_chunk_generated(chunk) then
            taskQueueAdd(time, chunk)
            printStepDebugData(time)
        end
    end
end
