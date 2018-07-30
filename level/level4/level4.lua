intersect = require "action/intersect"
local color = require "figure/color"
local point = require "figure/point"
local moving_line = require "figure/moving_line"
local moving_ball = require "figure/moving_ball"

local lg = love.graphics
local key = love.keyboard.isDown

local moving_line = moving_line.new(point.new(64,48), 0.01, color.red)
local moving_ball = moving_ball.new(point.new(30,72), 4, color.blue)
local level4 = {}

function level4:step(dt)
  moving_line:update(dt)
  moving_ball:update(dt)
  if intersect.line_ball(moving_line,moving_ball) then
    moving_ball.dir.x = moving_ball.dir.x * (-1)
    moving_ball.dir.y = moving_ball.dir.y * (-1)
  end
end

function level4:win_condition()
  return false
end

function level4:draw()
  moving_line:draw()
  moving_ball:draw()
end

return level4
