local color = require "figure/color"

local dot = {}

local lg = love.graphics

function dot.new(x1,y1,c)
  local inst = {}

  inst.x1 = x1
  inst.y1 = y1
  inst.c = c

  inst.draw = function(self)
    lg.setColor(self.c:to_params_norm())
    lg.points(self.x1, self.y1)
    color.clear()
  end

  return inst
end

return dot
