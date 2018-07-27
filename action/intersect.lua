local intersect = {}

function intersect.rectangles(a, b, d)
  if a.x > b.x - d and
     a.x + a.w < b.x + b.w + d and
     a.y > b.y - d and
     a.y + a.h < b.y + b.h + d then

    return true
  end

  return false
end

function intersect.circles(a, b, d)
  if a.x > b.x - d and
     a.x + a.r < b.x + b.r + d and
     a.y > b.y - d and
     a.y + a.r < b.y + b.r + d then

    return true
  end

  return false
end


return intersect
