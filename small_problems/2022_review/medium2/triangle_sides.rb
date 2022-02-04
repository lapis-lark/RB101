def triangle(s1, s2, s3)
  sides = [s1, s2, s3].sort
  lengths = sides.uniq.size

  case
  when sides.include?(0) || sides[0..1].sum <= sides[2] then :invalid
  when lengths == 1 then :equilateral
  when lengths == 2 then :isosceles
  else :scalene
  end
end

p triangle(3, 3, 3) == :equilateral
p triangle(3, 3, 1.5) == :isosceles
p triangle(3, 4, 5) == :scalene
p triangle(0, 3, 3) == :invalid
p triangle(3, 1, 1) == :invalid