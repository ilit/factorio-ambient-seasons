require "code.season_chunk_step"

if not seasonSurfaceStep then seasonSurfaceStep = {} end

function seasonSurfaceStep.exec(stepIndex)
    --game.print(stepIndex .. " @time " .. evalTime())

    for chunk in game.surfaces[1].get_chunks() do
        seasonChunkStep.exec(chunk)        
    end
end
