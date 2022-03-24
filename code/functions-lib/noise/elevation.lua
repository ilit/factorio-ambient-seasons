elevation = {}

local routines = {}

function elevation.set_common_routines(routinesArg)
    routines = routinesArg
end

function elevation.get(chunk)
    return noise.normalize(noise.generateRaw(chunk))
end

return elevation
