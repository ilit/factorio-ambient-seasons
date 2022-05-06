return function(time)
    game.print(game.ticks_played ..
            " month:" .. time.currentMonth ..
            " currentStepOfAMonth:" .. time.currentStepOfAMonth)

    --game.print("---")
end