function intersect(a, b, d)
  if a.x > b.x - d and
     a.x + a.w < b.x + b.w + d and
     a.y > b.y - d and
     a.y + a.h < b.y + b.h + d then

    return true
  end

  return false
end
