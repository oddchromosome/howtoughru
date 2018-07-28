move = require "action/move"
intersect = require "action/intersect"
local color = require "figure/color"
local rect = require "figure/rectangle"
local triangle = require "figure/triangle"

local level3 = {}

local key = love.keyboard.isDown

local tri1 = triangle.new(0,0,64,48,128,0,color.green)
local tri2 = triangle.new(64,48,128,0,128,96,color.blue)
local tri3 = triangle.new(0,96,64,48,128,96,color.yellow)
local tri4 = triangle.new(0,0,64,48,0,96,color.red)
local tri_r1 = triangle.new(64,48,96,24,32,24,color.white)
local tri_r2 = triangle.new(96,24,64,48,96,72,color.white)
local tri_r3 = triangle.new(64,48,96,72,32,72,color.white)
local tri_r4 = triangle.new(32,72,64,48,32,24,color.white)

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
      tri_r1.c = colors[u]
    end
  end
  if key("right") then
    if dr > limit then
      dr = 0
      r = inc_color_r(r)
      tri_r2.c = colors[r]
    end
  end
  if key("down") then
    if dd > limit then
      dd = 0
      d = inc_color_d(d)
      tri_r3.c = colors[d]
    end
  end
  if key("left") then
    if dl > limit then
      dl = 0
      l = inc_color_l(l)
      tri_r4.c = colors[l]
    end
  end
end

function level3:win_condition()
  local win = color.yellow == tri_r1.c and
              color.red == tri_r2.c and
              color.green == tri_r3.c and
              color.blue == tri_r4.c

  if win then
    tri1.c = color.white
    tri2.c = color.white
    tri3.c = color.white
    tri4.c = color.white
  end

  return win
end

function level3:draw()
  tri1:draw()
  tri2:draw()
  tri3:draw()
  tri4:draw()
  tri_r1:draw()
  tri_r2:draw()
  tri_r3:draw()
  tri_r4:draw()
end

return level3
