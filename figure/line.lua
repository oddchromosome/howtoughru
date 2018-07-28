local color = require "figure/color"

local line = {}

local lg = love.graphics

function line.new(x1,y1,x2,y2,c)
  local inst = {}

  inst.x1 = x1
  inst.y1 = y1
  inst.x2 = x2
  inst.y2 = y2
  inst.c = c

  inst.draw = function(self)
    lg.setColor(self.c:to_params_norm())
    lg.line(self.x1, self.y1, self.x2, self.y2)
    color.clear()
  end

  return inst
end

return line
