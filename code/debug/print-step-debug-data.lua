return function()
    game.print(game.ticks_played ..
            " month:" .. time.months.current() ..
            " leftPart:" .. time.months.leftPart() ..
            " rightPart:" .. time.months.rightPart())

    game.print("---")
end