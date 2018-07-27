move = require "action/move"
intersect = require "action/intersect"

local level1 = {}

local block = {
  x = 16,
  y = 16,
  w = 16,
  h = 16,
  draw = function(self)
    love.graphics.setColor(0,0,1)
    love.graphics.rectangle("fill", self.x, self.y, self.w, self.h)
    love.graphics.setColor(0,0,0)
  end
}

local goal = {
  x = 96,
  y = 64,
  w = 16,
  h = 16,
  draw = function(self)
    love.graphics.setColor(1,0,0)
    love.graphics.rectangle("fill", self.x, self.y, self.w, self.h)
    love.graphics.setColor(0,0,0)
  end
}

function level1:update()
  move:perform(block)

  if intersect.rectangles(block, goal, 4) then
    return level_state.WIN
  end
end

function level1:draw()
  goal:draw()
  block:draw()
end

return level1
