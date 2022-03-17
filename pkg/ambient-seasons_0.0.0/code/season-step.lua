return function(time)
    --game.print(stepIndex .. " @time " .. evalTime())

    for chunk in game.surfaces.nauvis.get_chunks() do
        tileLocalX = chunk.area.left_top.x - chunk.area.right_bottom.x
        --game.print("x: " .. chunk.x .. ", y: " .. chunk.y)
        --game.print("area: " .. serpent.line(chunk.area))
        
    end
end
