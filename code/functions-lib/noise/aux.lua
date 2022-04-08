local aux = {}

local routines = require "code/functions-lib/noise/common-routines"
local cache = require "code/persistence/cache"
local Chunk = require('__stdlib__/stdlib/area/chunk')
local Position = require('__stdlib__/stdlib/area/position')
local getPosNoiseFromChunk = require "code/functions-lib/utils/get-pos-noise-from-chunk"

function aux.getByChunk(chunk)
    if chunk.x == nil then error("chunk is nil") end
    if chunk.area == nil then error("chunk.area == nil") end

    local key = chunk.x .. "_" .. chunk.y
    if not cache.aux[key] then
        local PROP_NAME = "aux"
        local generatedNoise = routines.normalize(routines.generateRaw(chunk, PROP_NAME))
        cache.aux[key] = generatedNoise
    end

    return cache.aux[key]
end

function aux.getByPos(pos)
    if not pos then error("pos is nil") end
    if not pos.x then error("pos.x is nil") end

    local chunk = Position.chunk_position(pos)
    if not chunk then error("chunk is nil") end

    chunk.area = Chunk.to_area(pos)
    if not chunk.area.left_top then error("chunk.area.left_top is nil") end

    local auxChunk = aux.getByChunk(chunk)
    return getPosNoiseFromChunk(pos, auxChunk)
end

return aux
