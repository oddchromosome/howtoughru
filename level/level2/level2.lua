local move = require "action/move"
local intersect = require "action/intersect"
local circle = require "figure/circle"
local rect = require "figure/rectangle"
local color = require "figure/color"

local level2 = {}

local lg = love.graphics

local player = circle.new(16,48,8,color.new(255,255,255,0.5), true)
local one_rect = rect.new(92,16,24,24,color.red)
local two_rect = rect.new(16,64,24,24,color.blue)

local one_circle = circle.new(26,28,14,color.green)
local two_circle = circle.new(104,76,14,color.purple)
local reference = circle.new(64,48,48,color.new(255,255,70,0.3))

function level2:step()
  move:perform(player)

  if intersect.circle_rectangle(player, one_rect, 0) then
    player.c = color.copy(one_rect.c)
    player.c.a = 0.5
  elseif intersect.circle_rectangle(player, two_rect, 0) then
    player.c = color.copy(two_rect.c)
    player.c.a = 0.5
  end
end

function level2:win_condition()
  return intersect.circles_contain(one_circle, player, -1) and color.equal_color(player.c, one_rect.c)
end

function level2:draw()
  reference:draw()
  one_rect:draw()
  two_rect:draw()
  one_circle:draw()
  two_circle:draw()
  player:draw()
end

return level2
