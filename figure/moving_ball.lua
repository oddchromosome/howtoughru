local color = require "figure/color"
local point = require "figure/point"

local lg = love.graphics

local moving_ball = {}

local speed = 0.6
local d = 0.1

local update = function(self, dt)
  if self.point.x - self.radius + self.pad < 0 or self.point.x + self.radius + self.pad > game.pixel_width() then
    self.dir.x = self.dir.x * (-1)
  end
  if self.point.y - self.radius + self.pad < 0 or self.point.y + self.radius + self.pad > game.pixel_height() then
    self.dir.y = self.dir.y * (-1)
  end
  self.point.x = self.point.x + self.dir.x * self.speed
  self.point.y = self.point.y + self.dir.y * self.speed
end

local draw = function(self)
  lg.setColor(self.c:to_params_norm())
  lg.circle("fill",self.point.x,self.point.y,self.radius)
  color.clear()
end

moving_ball.new = function(center,radius,color)
  local inst = {}

  inst.point = center
  inst.dir = point.new(1,1)
  inst.radius = radius
  inst.c = color
  inst.pad = d
  inst.speed = speed

  inst.update = update
  inst.draw = draw

  return inst
end

return moving_ball
