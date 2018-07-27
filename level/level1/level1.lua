move = require "action/move"
intersect = require "action/intersect"
local rect = require "figure/rectangle"
local color = require "figure/color"

local level1 = {}

local block = rect.new(16,16,16,16,color.blue)
local goal = rect.new(92,60,24,24,color.red)

function level1:step()
  move:perform(block)
end

function level1:win_condition()
  return intersect.rectangles_contain(goal, block, 0)
end

function level1:draw()
  goal:draw()
  block:draw()
end

return level1
