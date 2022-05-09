constants = {}
constants.TOP_ELEVATION = 30
constants.STEPS_IN_A_MONTH = 4
local elevationToStep = require "code/functions-lib/noise/elevation-to-step"

local elevStep = {}

function elevStep:setup()
end

function elevStep:teardown()
end

function elevStep:testNormalValues()
    assertEquals(elevationToStep(1),1)
    assertEquals(elevationToStep(15),2)
    assertEquals(elevationToStep(25),3)
end

function elevStep:testInfElevation()
    assertEquals(elevationToStep(1111),4)
end

function elevStep:testNegativeError()
    assertEquals(assert_error(elevationToStep(-12)))
end

return elevStep
