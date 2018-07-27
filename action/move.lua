local move = {}

local key = love.keyboard.isDown
move.speed = 1
move.o = nil

function move:perform(obj)
  if key("right") then
    obj.x = obj.x + self.speed
    if obj.x > game.pixel_width() then
      obj.x = 0
    end
  end
  if key("left") then
    obj.x = obj.x - self.speed
    if obj.x < 0 then
      obj.x = game.pixel_width() - 1
    end
  end
  if key("up") then
    obj.y = obj.y - self.speed
    if obj.y < 0 then
      obj.y = game.pixel_height() - 1
    end
  end
  if key("down") then
    obj.y = obj.y + self.speed
    if obj.y > game.pixel_height() then
      obj.y = 0
    end
  end
end

return move
