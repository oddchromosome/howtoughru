local level_loader = {}

local update = function(self, dt)
  if self.state == level_state.PLAY then
    self.level_n:step(dt)
  elseif self.state == level_state.WIN then
    self.time_passed = self.time_passed + 1 * dt
    if self.time_passed > self.time_to_pass then
      return self.state
    end
  end

  if self.level_n:win_condition() then
    self.state = level_state.WIN
  end
end

local draw = function(self)
  self.level_n:draw()
end

function level_loader:new(level_n)
  local inst = {}
  inst.state = level_state.PLAY
  inst.time_passed = 0
  inst.time_to_pass = 0.35
  inst.level_n = level_n

  inst.update = update
  inst.draw = draw

  return inst
end

return level_loader
