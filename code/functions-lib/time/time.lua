local time = {}

time.seconds = require "code/functions-lib/time/seconds"
time.steps = require "code/functions-lib/time/steps"
time.steps.init(time.seconds)
time.months = require "code/functions-lib/time/months"
time.months.init(time.steps)

return time
