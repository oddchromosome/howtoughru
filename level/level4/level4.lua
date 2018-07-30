move = require "action/move"
local color = require "figure/color"
local point = require "figure/point"
local polar_line = require "figure/moving_line"

local lg = love.graphics
local key = love.keyboard.isDown

local moving_line = polar_line.new(point.new(64,48),
                                   0,
                                   color.red)
local level4 = {}

function level4:step(dt)
  moving_line:update(dt)
end

function level4:win_condition()
  return false
end

function level4:draw()
  moving_line:draw()
end

return level4
