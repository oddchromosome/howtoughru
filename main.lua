game = require "game"
level_manager = require "level/level_manager"
level_state = require "level/level_state"

function love.load()
  game:init()

  level_manager:load()
end

function love.update(dt)
  level_manager:update(dt)
end

function love.draw()
  game:scale()

  level_manager:draw()
end

love.keypressed = function(key)
  if key == "escape" then
   love.event.quit()
  end
end
