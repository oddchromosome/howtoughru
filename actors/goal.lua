action = require "interaction/intersect"

local goal = {}

goal.x = 112
goal.y = 80
goal.w = 8
goal.h = 8
goal.on = false
goal.object = nil

function goal:update()
  self.on = intersect(self.object, self, 4)
end

function goal:draw()
  if not self.on then
    love.graphics.setColor(1,0,0)
    love.graphics.rectangle("fill", self.x, self.y, self.w, self.h)
    love.graphics.setColor(0,0,0)
  else
    love.graphics.setColor(0,1,0)
    love.graphics.print("On!", 40, 8)
    love.graphics.setColor(0,0,0)
  end
end

return goal
