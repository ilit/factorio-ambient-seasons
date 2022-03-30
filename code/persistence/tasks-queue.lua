local deque = require "code/persistence/deque"

if not task_queue then task_queue = deque.new() end

return task_queue
