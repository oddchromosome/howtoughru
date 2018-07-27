move = require "action/move"
intersect = require "action/intersect"
local color = require "figure/color"
local rect = require "figure/rectangle"

local level3 = {}

local key = love.keyboard.isDown

local box1 = rect.new(0,0,64,48,color.green)
local box2 = rect.new(64,0,64,48,color.blue)
local box3 = rect.new(0,48,64,48,color.yellow)
local box4 = rect.new(64,48,64,48,color.red)
local box_r1 = rect.new(32,24,32,24,color.white)
local box_r2 = rect.new(64,24,32,24,color.white)
local box_r3 = rect.new(32,48,32,24,color.white)
local box_r4 = rect.new(64,48,32,24,color.white)

local colors = {
  color.white,
  color.green,
  color.blue,
  color.yellow,
  color.red
}

local inc_color_u = function(i)
  return i % 5 + 1
end
local inc_color_d = function(i)
  return (i + 2) % 5 + 1
end
local inc_color_r = function(i)
  return (i + 3) % 5 + 1
end
local inc_color_l = function(i)
  return i % 5 + 1
end

local u,r,d,l = 1,1,1,1
local du,dr,dd,dl = 0,0,0,0
local limit = 0.2

function level3:step(dt)
  du = du + dt
  dr = dr + dt
  dd = dd + dt
  dl = dl + dt

  if key("up") then
    if du > limit then
      du = 0
      u = inc_color_u(u)
      box_r1.c = colors[u]
    end
  end
  if key("right") then
    if dr > limit then
      dr = 0
      r = inc_color_r(r)
      box_r2.c = colors[r]
    end
  end
  if key("down") then
    if dd > limit then
      dd = 0
      d = inc_color_d(d)
      box_r3.c = colors[d]
    end
  end
  if key("left") then
    if dl > limit then
      dl = 0
      l = inc_color_l(l)
      box_r4.c = colors[l]
    end
  end
end

function level3:win_condition()
  return color.red == box_r1.c and
         color.yellow == box_r2.c and
         color.blue == box_r3.c and
         color.green == box_r4.c
end

function level3:draw()
  box1:draw()
  box2:draw()
  box3:draw()
  box4:draw()
  box_r1:draw()
  box_r2:draw()
  box_r3:draw()
  box_r4:draw()
end

return level3
