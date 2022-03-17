if not time then time = {} end

time.seconds = require "code/time/seconds"
time.steps = require "code/time/steps"
time.steps.init(seconds)
time.months = require "code/time/months"
time.months.init(steps)

return time
