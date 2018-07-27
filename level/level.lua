block = require "actors/block"
goal = require "actors/goal"

local level = {}

level.actors = {}

function level:load()
  level.actors[1] = block
  level.actors[2] = goal
  goal.object = block
end

function level:update()
  for i=1,#self.actors do
  --  if self.actors[i].dynamic then
      self.actors[i]:update()
  --  end
  end
end

function level:draw()
  for i=1,#self.actors do
    self.actors[i]:draw()
  end
end

return level
