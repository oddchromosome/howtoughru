local color = {}

local lg = love.graphics

color.new = function(r,g,b,a)
  local inst = {}
  inst.r = r
  inst.g = g
  inst.b = b
  inst.a = a

  inst.to_params_norm = function(self)
    return self.r/255,self.g/255,self.b/255,self.a
  end

  return inst
end

color.green = color.new(30,220,50)
color.blue = color.new(50,30,220)
color.yellow = color.new(220,220,0)
color.red = color.new(220,30,30)
color.white = color.new(255,255,255)
color.purple = color.new(220,0,220)
color.grey = color.new(110,110,110)

color.copy = function(c)
  return color.new(c.r,c.g,c.b,c.a)
end

color.equal_color = function(self, c)
  return self.r == c.r and self.g == c.g and self.b == c.b
end

color.clear = function()
  lg.setColor(1,1,1)
end

return color
