local color = require "figure/color"

local won = {}

function won:update()
end

function won:draw()
  love.graphics.setColor(color.green:to_params_norm())
  love.graphics.print("Won!", 48, 30)
  color.clear()
end

return won
