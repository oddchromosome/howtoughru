local color = require "figure/color"

local rectangle = {}

local lg = love.graphics

function rectangle.new(x,y,w,h,c)
  local inst = {}

  inst.x = x
  inst.y = y
  inst.w = w
  inst.h = h
  inst.c = c

  inst.draw = function(self)
    lg.setColor(self.c:to_params_norm())
    lg.rectangle("fill", self.x, self.y, self.w, self.h)
    color.clear()
  end

  return inst
end

return rectangle
