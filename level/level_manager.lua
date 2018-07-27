local level = require "level/level"

local level_manager = {}

level_manager.levels = {}
level_manager.current_level = nil

function level_manager:load()
  level:load()
  self.levels[1] = level

  self:set_level(1)
end

function level_manager:set_level(n)
  self.current_level = self.levels[n]
end

function level_manager:update()
  self.current_level:update()
end

function level_manager:draw()
  self.current_level:draw()
end

return level_manager
