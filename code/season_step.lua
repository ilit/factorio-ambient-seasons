if not seasonStep then seasonStep = {} end

function seasonStep.exec(stepIndex)
    game.print(stepIndex .. " @time " .. evalTime())

    for chunk in game.surfaces[1].get_chunks() do
        --game.player.print("x: " .. chunk.x .. ", y: " .. chunk.y)
        --game.player.print("area: " .. serpent.line(chunk.area))
        
    end
end