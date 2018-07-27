local won = {}

function won:update()
end

function won:draw()
  love.graphics.setColor(0,1,0)
  love.graphics.print("Won!", 48, 30)
  love.graphics.setColor(0,0,0)
end

return won
