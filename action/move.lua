local move = {}

local key = love.keyboard.isDown
move.speed = 1
move.o = nil

function move:perform(obj)
  if key("right") then
    obj.x = obj.x + self.speed
  end
  if key("left") then
    obj.x = obj.x - self.speed
  end
  if key("up") then
    obj.y = obj.y - self.speed
  end
  if key("down") then
    obj.y = obj.y + self.speed
  end
end

return move
