move = require "action/move"
intersect = require "action/intersect"

local level2 = {}

local lg = love.graphics

local player = {
  x = 16,
  y = 48,
  r = 8,
  draw = function(self)
    lg.setColor(0,1,0)
    lg.circle("fill", self.x, self.y, self.r)
    lg.setColor(0,0,0)
  end
}

local one_circle = {
  x = 88,
  y = 24,
  r = 8,
  draw = function(self)
    lg.setColor(1,1,0)
    lg.circle("fill", self.x, self.y, self.r)
    lg.setColor(0,0,0)
  end
}

local two_circle = {
  x = 88,
  y = 72,
  r = 8,
  draw = function(self)
    lg.setColor(1,0,1)
    lg.circle("fill", self.x, self.y, self.r)
    lg.setColor(0,0,0)
  end
}

function level2:update()
  move:perform(player)

  if intersect.circles(player, one_circle, 4) then
    return level_state.WIN
  end
end

function level2:draw()
  one_circle:draw()
  two_circle:draw()
  player:draw()
end

return level2
