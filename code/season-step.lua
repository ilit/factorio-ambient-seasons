return function(stepIndex)
    --game.print(stepIndex .. " @time " .. evalTime())

    for chunk in game.surfaces[1].get_chunks() do
        tileLocalX = chunk.area.left_top.x - chunk.area.right_bottom.x
        game.print("qwqwq")
        --game.print("x: " .. chunk.x .. ", y: " .. chunk.y)
        --game.print("area: " .. serpent.line(chunk.area))       
    end
end
