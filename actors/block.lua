local block = {}

local key = love.keyboard.isDown
block.x = 16
block.y = 16
block.w = 8
block.h = 8
block.speed = 1
block.dynamic = true

function block:update()
  if key("right") then
    self.x = self.x + self.speed
  end
  if key("left") then
    self.x = self.x - self.speed
  end
  if key("up") then
    self.y = self.y - self.speed
  end
  if key("down") then
    self.y = self.y + self.speed
  end
end

function block:draw()
  love.graphics.setColor(0,0,1)
  love.graphics.rectangle("fill", self.x, self.y, self.w, self.h)
  love.graphics.setColor(0,0,0)
end

return block
