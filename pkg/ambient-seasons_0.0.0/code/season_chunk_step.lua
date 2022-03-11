if not seasonChunkStep then seasonChunkStep = {} end

function seasonChunkStep.exec(chunk)
    tileLocalX = chunk.area.left_top.x - chunk.area.right_bottom.x
    game.print(tileLocalX)
    --game.print("x: " .. chunk.x .. ", y: " .. chunk.y)
    --game.print("area: " .. serpent.line(chunk.area))
end
