local Chunk = require('__stdlib__/stdlib/area/chunk')
local Position = require('__stdlib__/stdlib/area/position')
local getPosNoiseFromChunk = require "code/functions-lib/utils/get-pos-noise-from-chunk"

if not cacheGlob then
    cacheGlob = {}
    cacheGlob.elevation = {}
    cacheGlob.aux = {}
end

function cacheGlob.getByChunk(domain, generator, chunk)
    if domain == nil then error("domain is nil") end
    if generator == nil then error("generator is nil") end
    if chunk == nil then error("chunk is nil") end
    if chunk.x == nil then error("chunk is nil") end
    if chunk.area == nil then error("chunk.area == nil") end

    local x = chunk.x
    local y = chunk.y
    if not cacheGlob[domain] then cacheGlob[domain] = {} end
    if not cacheGlob[domain][x] then cacheGlob[domain][x] = {} end
    if not cacheGlob[domain][x][y] then
        local noiseVal, noiseX, noiseY = generator(chunk)
        cacheGlob[domain][x][y] = { noiseVal = noiseVal, noiseX = noiseX, noiseY = noiseY }
    end

    local c = cacheGlob[domain][x][y]

    return c.noiseVal, c.noiseX, c.noiseY
end

function cacheGlob.getByPos(domain, generator, pos)
    if domain == nil then error("domain is nil") end
    if pos == nil then error("pos is nil") end
    if pos.x == nil then error("pos.x is nil") end

    local chunk = Position.to_chunk_position(pos)
    if chunk == nil then error("chunk is nil") end
    if chunk.x == nil then error("chunk.x is nil") end

    chunk.area = Chunk.to_area(chunk)
    if chunk.area.left_top == nil then error("chunk.area.left_top is nil") end

    local noiseVals, noiseX, noiseY = cacheGlob.getByChunk(domain, generator, chunk)

    local noiseVal = getPosNoiseFromChunk(pos, noiseVals, noiseX, noiseY)

    return noiseVal
end

return cacheGlob
