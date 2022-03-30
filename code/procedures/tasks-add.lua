local taskQueue = require "code/persistence/tasks-queue"

return function (time, chunk)
    local task = {}
    task.time = time
    task.chunk = chunk
    taskQueue:push_right(task)
end
