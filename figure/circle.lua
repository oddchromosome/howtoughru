local color = require "figure/color"

local circle = {}

local lg = love.graphics

function circle.new(x,y,r,c,outline)
  local inst = {}

  inst.x = x
  inst.y = y
  inst.r = r
  inst.c = c
  inst.outline = outline

  inst.draw = function(self)
    lg.setColor(self.c:to_params_norm())
    lg.circle("fill", self.x, self.y, self.r)
    if outline then
      lg.setColor(color.orange:to_params_norm())
      lg.circle("line", self.x, self.y, self.r)
    end
    color.clear()
  end

  return inst
end

return circle
