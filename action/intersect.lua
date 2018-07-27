local intersect = {}

function intersect.rectangles_contain(a, b, d)
  if a.x < b.x + d and
     a.x + a.w > b.x + b.w - d and
     a.y < b.y + d and
     a.y + a.h > b.y + b.h - d then

    return true
  end

  return false
end

function intersect.circles_contain(a, b, d)
  if a.x - a.r < b.x - b.r + d and
     a.x + a.r > b.x + b.r - d and
     a.y - a.r < b.y - b.r + d and
     a.y + a.r > b.y + b.r - d then

    return true
  end

  return false
end

function intersect.circle_rectangle(a, b, d)
  if a.x - a.r > b.x - d and
     a.x + a.r < b.x + b.w + d and
     a.y - a.r > b.y - d and
     a.y + a.r < b.y + b.h + d then

    return true
  end

  return false
end

return intersect
