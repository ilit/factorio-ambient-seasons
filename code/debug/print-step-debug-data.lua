return function(time)
    game.print(game.ticks_played ..
            " month:" .. time.currentMonth ..
            " leftPart:" .. time.monthLeftRelPart ..
            " rightPart:" .. time.monthRightRelPart)

    --game.print("---")
end