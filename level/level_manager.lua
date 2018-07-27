local level1 = require "level/level1/level1"
local level2 = require "level/level2/level2"
local won = require "level/won"

local level_manager = {}

level_manager.levels = {}
level_manager.current_level = 0

function level_manager:load()
  self.levels[1] = level1
  self.levels[2] = level2
  self.levels[3] = won

  self.current_level = 1
end

function level_manager:update()
  if self:current():update() == level_state.WIN then
    self:next()
  end
end

function level_manager:draw()
  self:current():draw()
end

function level_manager:current()
  return self.levels[self.current_level]
end

function level_manager:next()
  self.current_level = self.current_level + 1
end

return level_manager
