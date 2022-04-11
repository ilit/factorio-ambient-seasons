local Chunk = require('__stdlib__/stdlib/area/chunk')
local Position = require('__stdlib__/stdlib/area/position')
local getPosNoiseFromChunk = require "code/functions-lib/utils/get-pos-noise-from-chunk"
local cacheLocal = {}

if not cacheGlob then
    cacheLocal.elevation = {}
    cacheLocal.aux = {}
    cacheGlob = cacheLocal --- Optimization
end

function cacheLocal.getByChunk(domain, generator, chunk)
    if domain == nil then error("domain is nil") end
    if generator == nil then error("generator is nil") end
    if chunk == nil then error("chunk is nil") end
    if chunk.x == nil then error("chunk is nil") end
    if chunk.area == nil then error("chunk.area == nil") end

    local x = chunk.x
    local y = chunk.y
    if not cacheLocal[domain] then cacheLocal[domain] = {} end
    if not cacheLocal[domain][x] then cacheLocal[domain][x] = {} end
    if not cacheLocal[domain][x][y] then
        cacheLocal[domain][x][y] = generator(chunk)
        --game.print("Generating "..domain.." for "..chunk.x.." "..chunk.y)
    end

    local chunkNoise = cacheLocal[domain][x][y]
    --if chunkNoise == nil then error("chunkNoise == nil") end
    --if table_size(chunkNoise) < 100 then error("table_size(chunkNoise) == "..table_size(chunkNoise)) end
    --if chunkNoise[1].x == nil then error("chunkNoise[1].x == nil "..table_size(chunkNoise)) end
    --if chunkNoise[1].val == nil then error("chunkNoise[1].val == nil") end
    --if type(chunkNoise[1].x) ~= "number" then error("chunkNoise[1].x is NaN") end
    --if type(chunkNoise[1].val) ~= "number" then error("chunkNoise[1].val is NaN") end

    return chunkNoise
end

function cacheLocal.getByPos(domain, generator, pos)
    if domain == nil then error("domain is nil") end
    if pos == nil then error("pos is nil") end
    if pos.x == nil then error("pos.x is nil") end

    local chunk = Position.to_chunk_position(pos)
    if chunk == nil then error("chunk is nil") end
    if chunk.x == nil then error("chunk.x is nil") end

    chunk.area = Chunk.to_area(chunk)
    if chunk.area.left_top == nil then error("chunk.area.left_top is nil") end

    local chunkNoise = cacheLocal.getByChunk(domain, generator, chunk)

    local noiseVal = getPosNoiseFromChunk(pos, chunkNoise)
    --if type(noiseVal) ~= "number" then error("NaN") end
    return noiseVal
end

return cacheLocal
