line_equation_x = function(point_a,point_b,x)
  x1 = point_a.x
  y1 = point_a.y
  x2 = point_b.x
  y2 = point_b.y

  if x2 ~= x1 then
    return (x - x1)*(y2 - y1)/(x2 - x1) + y1
  else
    if y1 == y2 then
      error("Same point passed: ("..x1..","..y1..")")
    end

    return y1
  end
end

line_equation_y = function(point_a,point_b,y)
  x1 = point_a.x
  y1 = point_a.y
  x2 = point_b.x
  y2 = point_b.y

  if y2 ~= y1 then
    return (y - y1)*(x2 - x1)/(y2 - y1) + x1
  else
    if x1 == x2 then
      error("Same point passed: ("..x1..","..y1..")")
    end

    return x1
  end
end

-- complete line by two dots
complete_line = function(point_a, angle)
  local dx = game.diagonal() * math.cos(angle)
  local dy = game.diagonal() * math.sin(angle)
  return point_a.x - dx, point_a.y - dy, point_a.x + dx, point_a.y + dy
end
