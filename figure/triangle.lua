local color = require "figure/color"

local triangle = {}

local lg = love.graphics

function triangle.new(x1,y1,x2,y2,x3,y3,c)
  local inst = {}

  inst.x1 = x1
  inst.y1 = y1
  inst.x2 = x2
  inst.y2 = y2
  inst.x3 = x3
  inst.y3 = y3
  inst.c = c

  inst.draw = function(self)
    lg.setColor(self.c:to_params_norm())
    lg.polygon("fill", self.x1, self.y1, self.x2, self.y2, self.x3, self.y3)
    color.clear()
  end

  return inst
end

return triangle
