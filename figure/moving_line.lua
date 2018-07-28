local color = require "figure/color"
local point = require "figure/point"

local lg = love.graphics
local key = love.keyboard.isDown

local moving_line = {}

local circle_thickness = 0.7
local line_speed = 0.7
local rad_speed = 0.02

local equation = function(self)
  return math.tan(self.rad) * self.x
end

local find_point_1 = function()
  -- TODO: hardcode
  return point.new(0,0)
end

local find_point_2 = function()
  -- TODO: hardcode
  return point.new(128,96)
end

local update = function(self,dt)
  if key("right") then
    if self.x + line_speed < game.pixel_width() then
      self.x = self.x + line_speed
      self.y = self:equation(self.x, self.rad)
    end
  end
  if key("left") then
    if self.x - line_speed > 0 then
      self.x = self.x - line_speed
      self.y = self:equation(self.x, self.rad)
    end
  end
  if key("up") then

  end
end

local draw = function(self)
  lg.setColor(self.c:to_params_norm())
  local p1 = find_point_1()
  local p2 = find_point_2()
  lg.line(p1.x, p1.y, p2.x, p2.y)
  color.clear()

  lg.setColor(self.p_c:to_params_norm())
  lg.circle("fill", self.x, self.y, circle_thickness)
  color.clear()
end

moving_line.new = function(point,color1,color2)
  local inst = {}

  inst.x = point.x
  inst.y = point.y
  inst.c = color1
  inst.p_c = color2
  inst.rad = math.atan(point.y / point.x)

  inst.equation = equation
  inst.update = update
  inst.draw = draw

  return inst
end

return moving_line
