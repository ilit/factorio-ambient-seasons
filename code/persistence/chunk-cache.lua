--- Caches data per position. Stores by chunks.

local Chunk = require('__stdlib__/stdlib/area/chunk')
local Position = require('__stdlib__/stdlib/area/position')
local getPosNoiseFromChunk = require "code/functions-lib/utils/get-pos-noise-from-chunk"

if not g_chunkCache then
    g_chunkCache = {}
end

function g_chunkCache.getByChunk(domain, generator, chunk)
    if domain == nil then error("domain is nil") end
    if generator == nil then error("generator is nil") end
    if chunk == nil then error("chunk is nil") end
    if chunk.x == nil then error("chunk is nil") end
    if chunk.area == nil then error("chunk.area == nil") end

    local ch_x = chunk.x
    local ch_y = chunk.y
    if not g_chunkCache[domain] then g_chunkCache[domain] = {} end
    if not g_chunkCache[domain][ch_x] then g_chunkCache[domain][ch_x] = {} end
    if not g_chunkCache[domain][ch_x][ch_y] then
        local noiseVal, noiseX, noiseY = generator(chunk)
        g_chunkCache[domain][ch_x][ch_y] = { noiseVal = noiseVal, noiseX = noiseX, noiseY = noiseY }
    end

    local c = g_chunkCache[domain][ch_x][ch_y]

    return c.noiseVal, c.noiseX, c.noiseY
end

function g_chunkCache.getByPos(domain, generator, pos)
    if domain == nil then error("domain is nil") end
    if pos == nil then error("pos is nil") end
    if pos.x == nil then error("pos.x is nil") end

    local chunk = Position.to_chunk_position(pos)
    if chunk == nil then error("chunk is nil") end
    if chunk.x == nil then error("chunk.x is nil") end

    chunk.area = Chunk.to_area(chunk)
    if chunk.area.left_top == nil then error("chunk.area.left_top is nil") end

    local noiseVals, noiseX, noiseY = g_chunkCache.getByChunk(domain, generator, chunk)

    local noiseVal = getPosNoiseFromChunk(pos, noiseVals, noiseX, noiseY)

    return noiseVal
end

return g_chunkCache
