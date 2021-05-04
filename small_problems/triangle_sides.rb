def triangle(a, b, c)
  sides = [a, b, c].sort
  return :invalid if invalid?(sides)
  return :equilateral if sides.all?(a)
  return :isoscles if sides[1] == sides[2]
  return :scalene
end

def invalid?(sides)
  sides[0..1].sum < sides[2] || sides.include?(0)
end

p triangle(3, 3, 3) #== :equilateral
p triangle(3, 3, 1.5) #== :isosceles
p triangle(3, 4, 5) == :scalene
p triangle(0, 3, 3) == :invalid
p triangle(3, 1, 1) == :invalid