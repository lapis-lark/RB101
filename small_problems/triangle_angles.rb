def triangle(a, b, c)
  angles = [a, b, c]
  return :invalid if angles.any?(0) || angles.sum !=  180
  return :right if angles.any?(90)
  return :acute if angles.none? { |a| a > 90}
  return :obtuse
end

p triangle(60, 70, 50) == :acute
p triangle(30, 90, 60) == :right
p triangle(120, 50, 10) == :obtuse
p triangle(0, 90, 90) == :invalid
p triangle(50, 50, 50) == :invalid