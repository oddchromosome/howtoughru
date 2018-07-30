local color = require "figure/color"
local point = require "figure/point"
local figure_utils = require "figure/figure_utils"

local lg = love.graphics
local key = love.keyboard.isDown

local moving_line = {}

local circle_thickness = 0.7
local distance_dt = 0.7
local angle_dt = 0.02
local radius = 1

local distance = function(point_a, point_b)
  return math.sqrt((point_b.x - point_a.x)*(point_b.x - point_a.x) +
                   (point_b.y - point_a.y)*(point_b.y - point_a.y))
end

local calculate_point_b = function(self)
  return point.new(self.point.x + radius * math.cos(self.angle), self.point.y + radius * math.sin(self.angle))
end

local draw = function(self)
  local x1,y1,x2,y2 = complete_line(self.point,self.angle)
  --self.point.x,self.point.y,self.point_b.x,self.point_b.y

  lg.setColor(color.white:to_params_norm())
  lg.line(x1,y1,x2,y2)
  color.clear()

  lg.setColor(self.c:to_params_norm())
  lg.circle("fill", self.point.x, self.point.y, circle_thickness)
  color.clear()
end

local update = function(self,dt)
  if key("up") then
    if self.angle + angle_dt > 2 * math.pi then
      self.angle = self.angle - 2 * math.pi
    end
    self.angle = self.angle + angle_dt
    self.point_b = calculate_point_b(self)
  end
  if key("down") then
    if self.angle - angle_dt < 0 then
      self.angle = 2 * math.pi + self.angle
    end
    self.angle = self.angle - angle_dt
    self.point_b = calculate_point_b(self)
  end
  if key("right") then
    local dx = distance_dt * math.cos(self.angle)
    local dy = distance_dt * math.sin(self.angle)
    local new_point = point.new(self.point.x + dx,
                                self.point.y + dy)
    if game.on_screen(new_point.x, new_point.y) then
      self.point.x = self.point.x + dx
      self.point.y = self.point.y + dy
      self.point_b = calculate_point_b(self)
    end
  end
  if key("left") then
    local dx = distance_dt * math.cos(self.angle)
    local dy = distance_dt * math.sin(self.angle)
    local new_point = point.new(self.point.x - dx,
                                self.point.y - dy)
    if game.on_screen(new_point.x, new_point.y) then
      self.point.x = self.point.x - dx
      self.point.y = self.point.y - dy
      self.point_b = calculate_point_b(self)
    end
  end
end

moving_line.new = function(point, angle, color)
  local inst = {}

  inst.point = point
  inst.angle = angle
  inst.point_b = calculate_point_b(inst)
  inst.c = color

  inst.draw = draw
  inst.update = update

  return inst
end

return moving_line
